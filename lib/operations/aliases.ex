defmodule FwdClient.Aliases do
  @moduledoc """
  Provides API endpoints related to aliases
  """
  use FwdClient.Encoder

  @default_client FwdClient.Client

  @doc """
  Creates an Alias
  """
  @spec create_snapshot_alias_using_put(
          String.t(),
          String.t(),
          FwdClient.BuilderOfAlias.t(),
          keyword
        ) :: {:ok, FwdClient.Alias.t()} | {:error, FwdClient.Error.t()}
  def create_snapshot_alias_using_put(snapshotId, name, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, name: name, body: body],
      call: {FwdClient.Aliases, :create_snapshot_alias_using_put},
      url: "/api/snapshots/#{snapshotId}/aliases/#{name}",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.BuilderOfAlias, :t}}],
      response: [{200, {FwdClient.Alias, :t}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes an Alias
  """
  @spec deactivate_alias_using_delete(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.Alias.t()} | {:error, FwdClient.Error.t()}
  def deactivate_alias_using_delete(snapshotId, name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, name: name],
      call: {FwdClient.Aliases, :deactivate_alias_using_delete},
      url: "/api/snapshots/#{snapshotId}/aliases/#{name}",
      method: :delete,
      response: [{200, {FwdClient.Alias, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes Aliases

  Use the optional `name` parameter to delete only specific Aliases. It can be repeated as in `?name=foo&name=bar`. Omit the `name` parameter to delete all Aliases active in the Snapshot.

  ## Options

    * `name`: name

  """
  @spec deactivate_aliases_using_delete(String.t(), keyword) ::
          {:ok, map} | {:error, FwdClient.Error.t()}
  def deactivate_aliases_using_delete(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:name])

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.Aliases, :deactivate_aliases_using_delete},
      url: "/api/snapshots/#{snapshotId}/aliases",
      method: :delete,
      query: query,
      response: [{200, :map}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets all Aliases
  """
  @spec get_all_aliases_using_get(String.t(), keyword) ::
          {:ok, map} | {:error, FwdClient.Error.t()}
  def get_all_aliases_using_get(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.Aliases, :get_all_aliases_using_get},
      url: "/api/snapshots/#{snapshotId}/aliases",
      method: :get,
      response: [{200, :map}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets an Alias
  """
  @spec get_single_alias_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.AliasAndValue.t()} | {:error, FwdClient.Error.t()}
  def get_single_alias_using_get(snapshotId, name, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, name: name],
      call: {FwdClient.Aliases, :get_single_alias_using_get},
      url: "/api/snapshots/#{snapshotId}/aliases/#{name}",
      method: :get,
      response: [{200, {FwdClient.AliasAndValue, :t}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end
end
