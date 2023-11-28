defmodule FwdClient.Checks do
  @moduledoc """
  Provides API endpoints related to checks
  """

  @default_client FwdClient.Client

  @doc """
  Adds a check

  Note that the returned NetworkCheckResult will never have status of type NONE or PROCESSING

  ## Options

    * `persistent`: Whether to associate check with any later snapshots (including future snapshots) too

  """
  @spec add_check_using_post(String.t(), FwdClient.NewNetworkCheck.t(), keyword) ::
          {:ok, FwdClient.NetworkCheckResult.t()} | {:error, FwdClient.ErrorInfo.t()}
  def add_check_using_post(snapshotId, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:persistent])

    client.request(%{
      args: [snapshotId: snapshotId, body: body],
      call: {FwdClient.Checks, :add_check_using_post},
      url: "/api/snapshots/#{snapshotId}/checks",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {FwdClient.NewNetworkCheck, :t}}],
      response: [{200, {FwdClient.NetworkCheckResult, :t}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Deactivates a check
  """
  @spec deactivate_check_using_delete(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.EmptyObject.t()} | :error
  def deactivate_check_using_delete(snapshotId, checkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, checkId: checkId],
      call: {FwdClient.Checks, :deactivate_check_using_delete},
      url: "/api/snapshots/#{snapshotId}/checks/#{checkId}",
      method: :delete,
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Deactivates all checks
  """
  @spec deactivate_checks_using_delete(String.t(), keyword) ::
          {:ok, FwdClient.EmptyObject.t()} | :error
  def deactivate_checks_using_delete(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.Checks, :deactivate_checks_using_delete},
      url: "/api/snapshots/#{snapshotId}/checks",
      method: :delete,
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets available Predefined checks
  """
  @spec get_available_predefined_checks_using_get(keyword) ::
          {:ok, [FwdClient.AvailablePredefinedCheck.t()]} | :error
  def get_available_predefined_checks_using_get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {FwdClient.Checks, :get_available_predefined_checks_using_get},
      url: "/api/predefinedChecks",
      method: :get,
      response: [{200, [{FwdClient.AvailablePredefinedCheck, :t}]}],
      opts: opts
    })
  end

  @doc """
  Gets checks (with status)

  ## Options

    * `type`: Can be repeated to request multiple types (as in `?type=NQE&type=Predefined`) or omitted to request all types.
    * `priority`: Can be repeated to request multiple priorities (as in `?priority=HIGH&priority=LOW`) or omitted to request all priorities.
    * `status`: Can be repeated to request multiple statuses (as in `?status=FAIL&status=ERROR`) or omitted to request all statuses.
      
      **Note:** The response will never contain results with `status` NONE or PROCESSING. The server will wait to respond, if necessary, until processing finishes or times out.

  """
  @spec get_checks_using_get(String.t(), keyword) ::
          {:ok, [FwdClient.NetworkCheckResult.t()]} | {:error, FwdClient.ErrorInfo.t()}
  def get_checks_using_get(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:priority, :status, :type])

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.Checks, :get_checks_using_get},
      url: "/api/snapshots/#{snapshotId}/checks",
      method: :get,
      query: query,
      response: [{200, [{FwdClient.NetworkCheckResult, :t}]}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a check (with status)

  Note that the returned NetworkCheckResults will never have status of type NONE or PROCESSING
  """
  @spec get_single_check_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.NetworkCheckResultWithDiagnosis.t()} | {:error, FwdClient.ErrorInfo.t()}
  def get_single_check_using_get(snapshotId, checkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, checkId: checkId],
      call: {FwdClient.Checks, :get_single_check_using_get},
      url: "/api/snapshots/#{snapshotId}/checks/#{checkId}",
      method: :get,
      response: [
        {200, {FwdClient.NetworkCheckResultWithDiagnosis, :t}},
        {409, {FwdClient.ErrorInfo, :t}}
      ],
      opts: opts
    })
  end
end
