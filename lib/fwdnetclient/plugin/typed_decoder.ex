defmodule FwdClient.Plugin.TypedDecoder do
  @moduledoc """
  Transform map responses into well-typed structs

  In a normal client stack, the HTTP request is followed by a JSON decoder such as
  `FwdClient.Plugin.JasonSerializer`. If the JSON library/plugin does not support decoding typed
  structs, then a separate step is necessary to transform the map responses into structs like
  `FwdClient.Repository`.

  This module provides a two plugins: `decode_response/2` and `normalize_errors/2`, that accept no
  configuration. `decode_response/2` uses the type information available in the operation and each
  module's `__fields__/1` functions to decode the data. `normalize_errors/2` changes API error
  responses into standard `FwdClient.Error` results. It is recommended to run these plugins towards
  the end of the stack, after decoding JSON responses.

  The normalized errors will be `FwdClient.Error` structs with relevant reason fields where possible.

  ## Special Cases

  There are a few special cases where the decoder must make an inference about which type to use.
  If you find that you are unable to decode something, please open an issue with information about
  the operation and types involved.

  Union types often require this kind of inference. This module handles them on a case-by-case
  basis using required keys to determine the correct type. Some of these are done on a "best
  guess" basis due to a lack of official documentation.
  """
  alias FwdClient.Error
  alias FwdClient.Operation
  alias FwdClient.Repository.Rule

  @doc """
  Decode a response body based on type information from the operation and schemas
  """
  @spec decode_response(Operation.t(), keyword) :: {:ok, Operation.t()}
  def decode_response(operation, _opts) do
    %Operation{response_body: body, response_code: code, response_types: types} = operation

    case get_type(types, code) do
      {:ok, response_type} ->
        decoded_body = do_decode(body, response_type)
        {:ok, %Operation{operation | response_body: decoded_body}}

      {:error, :not_found} ->
        {:ok, operation}
    end
  end

  defp get_type(types, code) do
    if res = Enum.find(types, fn {c, _} -> c == code end) do
      {:ok, elem(res, 1)}
    else
      {:error, :not_found}
    end
  end

  defp do_decode(nil, _), do: nil
  defp do_decode("", :null), do: nil
  defp do_decode(value, {:string, :date}), do: Date.from_iso8601!(value)
  defp do_decode(value, {:string, :date_time}), do: DateTime.from_iso8601(value) |> elem(1)
  defp do_decode(value, {:string, :time}), do: Time.from_iso8601!(value)
  defp do_decode(value, {:union, types}), do: do_decode(value, choose_union(value, types))

  defp do_decode(value, [type]), do: Enum.map(value, &do_decode(&1, type))

  defp do_decode(%{} = value, {module, type}) do
    fields = module.__fields__(type)

    for {field_name, field_type} <- fields, reduce: struct(module) do
      decoded_value ->
        case Map.fetch(value, to_string(field_name)) do
          {:ok, field_value} ->
            decoded_field_value = do_decode(field_value, field_type)
            struct(decoded_value, [{field_name, decoded_field_value}])

          :error ->
            decoded_value
        end
    end
  end

  defp do_decode(value, _type), do: value

  @doc """
  Change API error responses into `FwdClient.Error` results
  """
  @spec normalize_errors(Operation.t(), keyword) :: {:ok, Operation.t()} | {:error, Error.t()}
  def normalize_errors(%Operation{response_code: code} = operation, _opts) when code >= 400 do
    %Operation{response_body: body} = operation

    error_attributes =
      Keyword.merge(
        [
          code: code,
          operation: operation,
          source: body,
          step: {__MODULE__, :normalize_errors}
        ],
        error_attributes(code, body)
      )

    {:error, Error.new(error_attributes)}
  end

  def normalize_errors(operation, _opts), do: {:ok, operation}

  @spec error_attributes(integer | nil, any) :: keyword
  defp error_attributes(400, %{"errors" => "The version you specified" <> _ = message}) do
    [message: message, reason: :invalid_version]
  end

  # Invalid credentials
  defp error_attributes(401, %{"message" => "Bad credentials" = message}) do
    [message: message, reason: :invalid_auth]
  end

  defp error_attributes(401, %{message: "Bad credentials" = message}) do
    [message: message, reason: :invalid_auth]
  end

  # Requires authentication
  defp error_attributes(401, %{"message" => "Requires authentication" = message}) do
    [message: message, reason: :requires_auth]
  end

  defp error_attributes(401, %{message: "Requires authentication" = message}) do
    [message: message, reason: :requires_auth]
  end

  # Unauthorized
  defp error_attributes(403, %{"message" => "Must have admin rights" <> _ = message}) do
    [message: message, reason: :unauthorized]
  end

  defp error_attributes(403, %{message: "Must have admin rights" <> _ = message}) do
    [message: message, reason: :unauthorized]
  end

  # OAuth app restrictions
  defp error_attributes(403, %{"message" => "Although you appear to have" <> _ = message}) do
    [message: message, reason: :oauth_restricted]
  end

  defp error_attributes(403, %{message: "Although you appear to have" <> _ = message}) do
    [message: message, reason: :oauth_restricted]
  end

  # Rate limits
  defp error_attributes(403, %{"message" => "API rate limit exceeded" <> _ = message}) do
    [message: message, reason: :rate_limited]
  end

  defp error_attributes(403, %{message: "API rate limit exceeded" <> _ = message}) do
    [message: message, reason: :rate_limited]
  end

  defp error_attributes(403, %{"message" => "You have exceeded a secondary" <> _ = message}) do
    [message: message, reason: :rate_limited]
  end

  defp error_attributes(403, %{message: "You have exceeded a secondary" <> _ = message}) do
    [message: message, reason: :rate_limited]
  end

  # Not found
  defp error_attributes(404, _response) do
    [message: "Not Found", reason: :not_found]
  end

  defp error_attributes(_code, %{"message" => message}), do: [message: message]
  defp error_attributes(_code, %{message: message}), do: [message: message]
  defp error_attributes(_code, _response), do: [message: "Unknown Error"]

  #
  # Union Type Handlers
  #

  defp choose_union(nil, [_type, :null]), do: :null
  defp choose_union(nil, [:null, _type]), do: :null
  defp choose_union(_value, [type, :null]), do: type
  defp choose_union(_value, [:null, type]), do: type

  defp choose_union(%{}, [:map, {:string, :generic}]), do: :map
  defp choose_union(_value, [:map, {:string, :generic}]), do: {:string, :generic}

  defp choose_union(value, [:number, {:string, :generic}]) when is_number(value), do: :number
  defp choose_union(_value, [:number, {:string, :generic}]), do: :string

  defp choose_union(value, [
         :map,
         {:string, :generic},
         [:map],
         [{:string, :generic}]
       ]) do
    cond do
      is_binary(value) ->
        {:string, :generic}

      is_map(value) ->
        :map

      is_list(value) ->
        case value do
          [%{} | _] -> [:map]
          _else -> [{:string, :generic}]
        end
    end
  end

  defp choose_union(value, [[{FwdClient.StarredRepository, :t}], [{FwdClient.Repository, :t}]]) do
    case value do
      [%{"repo" => _}] -> [{FwdClient.StarredRepository, :t}]
      _else -> [{FwdClient.Repository, :t}]
    end
  end

  defp choose_union(value, [[:map], [{FwdClient.User, :simple}]]) do
    case value do
      [%{"user" => _}] -> [:map]
      _else -> [{FwdClient.User, :simple}]
    end
  end

  # Map type is for JSON+SARIF.
  defp choose_union(_value, [:map, {FwdClient.CodeScanning.Analysis, :t}]) do
    {FwdClient.CodeScanning.Analysis, :t}
  end

  defp choose_union(value, [:map, {FwdClient.Interaction.Limit.Response, :t}]) do
    if Map.has_key?(value, "limit") do
      {FwdClient.Interaction.Limit.Response, :t}
    else
      :map
    end
  end

  # Until the generator supports combining oneOf schemas
  defp choose_union(_value, [
         {FwdClient.Repository.IdAndRefName, :t},
         {FwdClient.Repository.NameAndRefName, :t},
         {FwdClient.Repository.Ruleset.Conditions, :t}
       ]) do
    :map
  end

  defp choose_union(value, [
         {Rule.BranchNamePattern, :t},
         {Rule.CommitAuthorEmailPattern, :t},
         {Rule.CommitMessagePattern, :t},
         {Rule.CommitterEmailPattern, :t},
         {Rule.Creation, :t},
         {Rule.Deletion, :t},
         {Rule.NonFastForward, :t},
         {Rule.PullRequest, :t},
         {Rule.RequiredDeployments, :t},
         {Rule.RequiredLinearHistory, :t},
         {Rule.RequiredSignatures, :t},
         {Rule.RequiredStatusChecks, :t},
         {Rule.TagNamePattern, :t},
         {Rule.Update, :t}
       ]) do
    case value do
      %{"type" => "branch_name_pattern"} -> {Rule.BranchNamePattern, :t}
      %{"type" => "commit_author_email_pattern"} -> {Rule.CommitAuthorEmailPattern, :t}
      %{"type" => "commit_message_pattern"} -> {Rule.CommitMessagePattern, :t}
      %{"type" => "committer_email_pattern"} -> {Rule.CommitterEmailPattern, :t}
      %{"type" => "creation"} -> {Rule.Creation, :t}
      %{"type" => "deletion"} -> {Rule.Deletion, :t}
      %{"type" => "non_fast_forward"} -> {Rule.NonFastForward, :t}
      %{"type" => "pull_request"} -> {Rule.PullRequest, :t}
      %{"type" => "required_deployments"} -> {Rule.RequiredDeployments, :t}
      %{"type" => "required_linear_history"} -> {Rule.RequiredLinearHistory, :t}
      %{"type" => "required_signatures"} -> {Rule.RequiredSignatures, :t}
      %{"type" => "required_status_checks"} -> {Rule.RequiredStatusChecks, :t}
      %{"type" => "tag_name_pattern"} -> {Rule.TagNamePattern, :t}
      %{"type" => "update"} -> {Rule.Update, :t}
    end
  end

  defp choose_union(value, [
         {FwdClient.Actions.ReviewCustomGates.CommentRequired, :t},
         {FwdClient.Actions.ReviewCustomGates.StateRequired, :t}
       ]) do
    case value do
      %{"state" => _} -> {FwdClient.Actions.ReviewCustomGates.StateRequired, :t}
      _else -> {FwdClient.Actions.ReviewCustomGates.CommentRequired, :t}
    end
  end

  defp choose_union(value, [{FwdClient.BasicError, :t}, {FwdClient.SCIM.Error, :t}]) do
    case value do
      %{"detail" => _} -> {FwdClient.SCIM.Error, :t}
      %{"schemas" => _} -> {FwdClient.SCIM.Error, :t}
      %{"scimType" => _} -> {FwdClient.SCIM.Error, :t}
      _else -> {FwdClient.BasicError, :t}
    end
  end

  defp choose_union(value, [{FwdClient.ValidationError, :simple}, {FwdClient.ValidationError, :t}]) do
    case value do
      %{"errors" => [%{} | _]} -> {FwdClient.ValidationError, :t}
      _else -> {FwdClient.ValidationError, :simple}
    end
  end

  defp choose_union(_value, [{FwdClient.User, :private}, {FwdClient.User, :public}]) do
    # Private has a superset of public fields, and they use the same struct
    {FwdClient.User, :private}
  end

  # Warning: Most of the event fields are undocumented in the spec, so this is a best guess.
  defp choose_union(value, [{FwdClient.Issue.Event.AddedToProject, :t} | _]) do
    case value do
      %{"event" => "added_to_project"} -> {FwdClient.Issue.Event.AddedToProject, :t}
      %{"event" => "assigned", "assigner" => _} -> {FwdClient.Issue.Event.Assigned, :t}
      %{"event" => "converted_note_to_issue"} -> {FwdClient.Issue.Event.ConvertedNoteToIssue, :t}
      %{"event" => "demilestoned"} -> {FwdClient.Issue.Event.Demilestoned, :t}
      %{"event" => "labeled"} -> {FwdClient.Issue.Event.Labeled, :t}
      %{"event" => "locked"} -> {FwdClient.Issue.Event.Locked, :t}
      %{"event" => "milestoned"} -> {FwdClient.Issue.Event.Milestoned, :t}
      %{"event" => "moved_column_in_project"} -> {FwdClient.Issue.Event.MovedColumnInProject, :t}
      %{"event" => "removed_from_project"} -> {FwdClient.Issue.Event.RemovedFromProject, :t}
      %{"event" => "renamed"} -> {FwdClient.Issue.Event.Renamed, :t}
      %{"event" => "review_dismissed"} -> {FwdClient.Issue.Event.ReviewDismissed, :t}
      %{"event" => "review_request_removed"} -> {FwdClient.Issue.Event.ReviewRequestRemoved, :t}
      %{"event" => "review_requested"} -> {FwdClient.Issue.Event.ReviewRequested, :t}
      %{"event" => "unassigned", "assigner" => _} -> {FwdClient.Issue.Event.Unassigned, :t}
      %{"event" => "unlabeled"} -> {FwdClient.Issue.Event.Unlabeled, :t}
      %{"event" => "assigned"} -> {FwdClient.Timeline.AssignedIssueEvent, :t}
      %{"event" => "commented"} -> {FwdClient.Timeline.CommentEvent, :t}
      %{"event" => "commented", "commit_id" => _} -> {FwdClient.Timeline.CommitCommentedEvent, :t}
      %{"event" => "committed"} -> {FwdClient.Timeline.CommittedEvent, :t}
      %{"event" => "cross-referenced"} -> {FwdClient.Timeline.CrossReferencedEvent, :t}
      %{"event" => "commented", "comments" => _} -> {FwdClient.Timeline.LineCommentedEvent, :t}
      %{"event" => "reviewed"} -> {FwdClient.Timeline.ReviewedEvent, :t}
      %{"event" => "unassigned"} -> {FwdClient.Timeline.UnassignedIssueEvent, :t}
      %{"event" => _, "state_reason" => _} -> {FwdClient.Issue.Event.StateChange, :t}
    end
  end

  defp choose_union(value, [
         {FwdClient.Content.File, :t},
         {FwdClient.Content.Submodule, :t},
         {FwdClient.Content.Symlink, :t},
         {FwdClient.Content.Tree, :t},
         [:map]
       ]) do
    case value do
      list when is_list(list) -> [:map]
      %{"content" => _} -> {FwdClient.Content.File, :t}
      %{"target" => _} -> {FwdClient.Content.Symlink, :t}
      %{"submodule_git_url" => _} -> {FwdClient.Content.Submodule, :t}
      _else -> {FwdClient.Content.Tree, :t}
    end
  end

  defp choose_union(value, [{FwdClient.Enterprise, :t}, {FwdClient.User, :simple}]) do
    case value do
      %{"slug" => _} -> {FwdClient.Enterprise, :t}
      _else -> {FwdClient.User, :simple}
    end
  end

  defp choose_union(value, [{FwdClient.Enterprise, :t}, {FwdClient.User, :simple}, :null]) do
    case value do
      nil -> :null
      %{"slug" => _} -> {FwdClient.Enterprise, :t}
      _else -> {FwdClient.User, :simple}
    end
  end

  defp choose_union(value, [
         {FwdClient.Organization, :t},
         {FwdClient.Team, :t},
         {FwdClient.User, :simple}
       ]) do
    case value do
      %{"company" => _} -> {FwdClient.Organization, :t}
      %{"members_url" => _} -> {FwdClient.Team, :t}
      %{"organizations_url" => _} -> {FwdClient.User, :simple}
    end
  end

  defp choose_union(value, [
         {FwdClient.SecretScanning.LocationCommit, :t},
         {FwdClient.SecretScanning.LocationIssueBody, :t},
         {FwdClient.SecretScanning.LocationIssueComment, :t},
         {FwdClient.SecretScanning.LocationIssueTitle, :t}
       ]) do
    case value do
      %{"commit_sha" => _} -> {FwdClient.SecretScanning.LocationCommit, :t}
      %{"issue_body_url" => _} -> {FwdClient.SecretScanning.LocationIssueBody, :t}
      %{"issue_comment_url" => _} -> {FwdClient.SecretScanning.LocationIssueComment, :t}
      %{"issue_title_url" => _} -> {FwdClient.SecretScanning.LocationIssueTitle, :t}
    end
  end

  defp choose_union(_value, types) do
    raise "TypedDecoder: Unable to decode union type #{inspect(types)}; not implemented"
  end
end
