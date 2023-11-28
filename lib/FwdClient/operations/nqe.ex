defmodule FwdClient.Nqe do
  @moduledoc """
  Provides API endpoints related to nqe
  """

  @default_client FwdClient.Client

  @doc """
  Lists all NQE queries

  ## Options

    * `dir`: If specified, include only queries in the given directory. The directory must start and end with a forward slash, such as `/L3/Advanced/`.

  """
  @spec get_nqe_queries_using_get(keyword) :: {:ok, [FwdClient.NqeQuery.t()]} | :error
  def get_nqe_queries_using_get(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:dir])

    client.request(%{
      args: [],
      call: {FwdClient.Nqe, :get_nqe_queries_using_get},
      url: "/api/nqe/queries",
      method: :get,
      query: query,
      response: [{200, [{FwdClient.NqeQuery, :t}]}],
      opts: opts
    })
  end

  @doc """
  Runs an NQE query on a Snapshot.

  ## Options

    * `snapshotId`: The ID of Snapshot to query. Exactly one of the snapshotId and networkId parameters must be provided.
    * `networkId`: The ID of the Network to query. The query will be run on the latest Snapshot for the given Network. Exactly one of the snapshotId and networkId parameters must be provided.

  """
  @spec run_nqe_query_using_post(FwdClient.NqeQueryRunRequest.t(), keyword) ::
          {:ok, FwdClient.NqeRunResult.t()} | {:error, FwdClient.NqeErrorInfo.t()}
  def run_nqe_query_using_post(body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:networkId, :snapshotId])

    client.request(%{
      args: [body: body],
      call: {FwdClient.Nqe, :run_nqe_query_using_post},
      url: "/api/nqe",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {FwdClient.NqeQueryRunRequest, :t}}],
      response: [{200, {FwdClient.NqeRunResult, :t}}, {400, {FwdClient.NqeErrorInfo, :t}}],
      opts: opts
    })
  end
end
