defmodule FwdClient.SystemAdministration do
  @moduledoc """
  Provides API endpoints related to system administration
  """

  @default_client FwdClient.Client

  @doc """
  Exports a database backup .zip file

  **Deprecated.** This operation will be removed in release 23.10.

  Use [Cluster Backup/Restore](/docs/enterprise/administration/on-prem/backup-restore) instead.

  ## Options

    * `variant`: Use `?variant=lightweight` to omit all network Snapshot data.

  """
  @spec export_database_using_get(keyword) :: :ok | :error
  def export_database_using_get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:variant])

    client.request(%{
      args: [],
      call: {FwdClient.SystemAdministration, :export_database_using_get},
      url: "/api/database",
      method: :get,
      query: query,
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  Exports the CVE index

  The CVE index is a gzipped binary (.bin.gz) file. #magic___^_^___line #magic___^_^___line To download the latest one from fwd.app: #magic___^_^___line #magic___^_^___line `curl -vu <user>:<pass> https://fwd.app/api/cve-index -o cve-index.bin.gz` #magic___^_^___line #magic___^_^___line The response includes a `Digest` header containing the file’s SHA-256 digest.
  """
  @spec get_cve_index_using_get(keyword) :: {:ok, String.t()} | :error
  def get_cve_index_using_get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {FwdClient.SystemAdministration, :get_cve_index_using_get},
      url: "/api/cve-index",
      method: :get,
      response: [{200, {:string, :generic}}],
      opts: opts
    })
  end

  @doc """
  Restores from a database backup .zip file

  **Deprecated.** This operation will be removed in release 23.10.

  Use [Cluster Backup/Restore](/docs/enterprise/administration/on-prem/backup-restore) instead.
  """
  @spec import_database_using_put(keyword) :: :ok | :error
  def import_database_using_put(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {FwdClient.SystemAdministration, :import_database_using_put},
      url: "/api/database",
      method: :put,
      response: [{202, :null}],
      opts: opts
    })
  end

  @doc """
  Imports a new CVE index

  Replaces the CVE index in use.

  To upload a CVE index gzipped binary (.bin.gz) file downloaded from fwd.app:

  `curl -vu <user>:<pass> https://<host>/api/cve-index?sha=<digest> -T cve-index.bin.gz`

  The `sha` parameter is optional but recommended. The `<digest>` value can be found in the `Digest` response header when a CVE index is downloaded from fwd.app.

  **Note:** This operation is for on-premises deployments only.

  ## Options

    * `sha`: Optional SHA-256 digest (consisting of 64 hex digits) to use to verify the integrity of the CVE index

  """
  @spec put_cve_index_using_put(String.t(), keyword) :: :ok | :error
  def put_cve_index_using_put(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:sha])

    client.request(%{
      args: [body: body],
      call: {FwdClient.SystemAdministration, :put_cve_index_using_put},
      url: "/api/cve-index",
      body: body,
      method: :put,
      query: query,
      request: [{"application/json", {:string, :generic}}],
      response: [{200, :null}],
      opts: opts
    })
  end
end
