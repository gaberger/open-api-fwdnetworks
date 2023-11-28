defmodule FwdClient.PathSearch do
  @moduledoc """
  Provides API endpoints related to path search
  """

  @default_client FwdClient.Client

  @doc """
  Lists known L7 applications
  """
  @spec get_l7_applications_using_get(keyword) :: {:ok, [FwdClient.L7Application.t()]} | :error
  def get_l7_applications_using_get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {FwdClient.PathSearch, :get_l7_applications_using_get},
      url: "/api/l7-applications",
      method: :get,
      response: [{200, [{FwdClient.L7Application, :t}]}],
      opts: opts
    })
  end

  @doc """
  Searches for paths by tracing sets of packets through the network

  This operation was deprecated in release 23.9. Please switch to POST /networks/{networkId}/paths-bulk[?snapshotId={snapshotId}] before release 23.12.
  """
  @spec get_paths_bulk_by_snapshot_using_post(
          String.t(),
          FwdClient.PathSearchBulkRequest.t(),
          keyword
        ) :: {:ok, [FwdClient.PathSearchResponse.t()]} | {:error, FwdClient.ErrorInfo.t()}
  def get_paths_bulk_by_snapshot_using_post(snapshotId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, body: body],
      call: {FwdClient.PathSearch, :get_paths_bulk_by_snapshot_using_post},
      url: "/api/snapshots/#{snapshotId}/pathsBulk",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.PathSearchBulkRequest, :t}}],
      response: [
        {200, [{FwdClient.PathSearchResponse, :t}]},
        {400, :null},
        {409, {FwdClient.ErrorInfo, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Searches for paths by tracing sets of packets through the network

  ## Options

    * `snapshotId`: An optional Snapshot id. If omitted, the network’s latest processed Snapshot is used.

  """
  @spec get_paths_bulk_using_post(String.t(), FwdClient.PathSearchBulkRequest.t(), keyword) ::
          {:ok, [FwdClient.PathSearchResponse.t()]} | {:error, FwdClient.ErrorInfo.t()}
  def get_paths_bulk_using_post(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:snapshotId])

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.PathSearch, :get_paths_bulk_using_post},
      url: "/api/networks/#{networkId}/paths-bulk",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {FwdClient.PathSearchBulkRequest, :t}}],
      response: [
        {200, [{FwdClient.PathSearchResponse, :t}]},
        {400, :null},
        {409, {FwdClient.ErrorInfo, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Searches for paths by tracing packets through the network

  This operation was deprecated in release 23.9. Please switch to GET /networks/{networkId}/paths[?snapshotId={snapshotId}] before release 23.12.

  ## Options

    * `srcIp`: the source IP address or subnet of packets entering the network. For multicast (*, G) paths, set srcIp = G (multicast group address).
    * `dstIp`: the destination IP address or subnet of packets entering the network. For multicast (*, G) paths, set dstIp = G (multicast group address).
    * `intent`: Specifies the intent for the search. Default PREFER_DELIVERED.
      *PREFER_VIOLATIONS*: Prefer paths that result in the traffic not getting delivered, e.g. drops, blackholes, loops. An example usage is while trying to evaluate if the specified traffic always gets delivered to the destination along all path choices.
      *PREFER_DELIVERED*: Prefer paths that result in the traffic getting delivered. An example usage is while trying to evaluate if traffic gets delivered to the destination along any path choice.
      *VIOLATIONS_ONLY*: Search for paths where traffic is not delivered to the destination.
    * `ipProto`: the IP protocol
    * `srcPort`: the L4 source port, like "80" or a range "8080-8088"
    * `dstPort`: the L4 destination port, like "80" or a range "8080-8088"
    * `icmpType`: the ICMP type. Implies ipProto = 1.
    * `fin`: the FIN (finish) bit (0 or 1). Implies ipProto = 6.
    * `syn`: the SYN (synchronize) bit (0 or 1). Implies ipProto = 6.
    * `rst`: the RST (reset) bit (0 or 1). Implies ipProto = 6.
    * `psh`: the PSH (push) bit (0 or 1). Implies ipProto = 6.
    * `ack`: the ACK (acknowledgment) bit (0 or 1). Implies ipProto = 6.
    * `urg`: the URG (urgent) bit (0 or 1). Implies ipProto = 6.
    * `appId`: the L7 app-id or "unidentified" to exclude paths that traverse firewall policies with app-id matches. If the system doesn't recognize the provided value, it handles the value the same as "unidentified" and includes the value in the `unrecognizedValues` response field. The applications that are recognized by the model can be obtained using GET /api/l7-applications.
    * `userId`: the L7 user-id or "unidentified" to exclude paths that traverse firewall policies with user-id matches. If the system doesn't recognize the provided value, it handles the value the same as "unidentified" and includes the value in the `unrecognizedValues` response field. See [Path Analysis with Layer 7 User-Group](/docs/enterprise/applications/search/path-analysis/layer7_ugroup/) for more info.
    * `userGroupId`: the L7 user-group-id. If the system doesn't recognize the provided value, the search returns 0 results as there are no paths that traverse firewall policies with that user-group-id match, and the value is included in the `unrecognizedValues` response field. See [Path Analysis with Layer 7 User-Group](/docs/enterprise/applications/search/path-analysis/layer7_ugroup/) for more info.
    * `url`: the L7 URL that traffic of interest is trying to access. Prefix wildcards are supported for subdomains. Suffix wildcards are supported for top-level domains and URL paths. See [Path Analysis with Layer 7 URL](/docs/enterprise/applications/search/path-analysis/layer7_url/) for more policy patterns supported in the model.
    * `includeNetworkFunctions`: If true, the response includes detailed forwarding info for each hop.
      Note: Setting this to true increases the API response time.
    * `maxCandidates`: the limit on the number of search results computed, before applying any ranking criteria. Permitted range = 1 to 10,000. Default 5,000.
    * `maxResults`: the limit on the number of search results returned by the API. First, the platform computes up to maxCandidates results that match the search criteria. Then they are sorted by various ranking criteria. A key ranking factor is path length, preferring longer paths (greatest reach) in the network over shorter ones. Finally, the API limits the number of returned search results to maxResults. Permitted range = 1 to maxCandidates. Default 1.
    * `maxReturnPathResults`: the limit on the number of return path search results. Permitted range = 0 to 10,000. Default 0. Multicast (*, G) and (S, G) queries will always return 0 return path results regardless of this value.
    * `maxSeconds`: the timeout duration. Permitted range = 1 to 300. Default 30.

  """
  @spec get_paths_by_snapshot_using_get(String.t(), keyword) ::
          {:ok, FwdClient.PathSearchResponse.t()} | {:error, FwdClient.ErrorInfo.t()}
  def get_paths_by_snapshot_using_get(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :ack,
        :appId,
        :dstIp,
        :dstPort,
        :fin,
        :icmpType,
        :includeNetworkFunctions,
        :intent,
        :ipProto,
        :maxCandidates,
        :maxResults,
        :maxReturnPathResults,
        :maxSeconds,
        :psh,
        :rst,
        :srcIp,
        :srcPort,
        :syn,
        :urg,
        :url,
        :userGroupId,
        :userId
      ])

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.PathSearch, :get_paths_by_snapshot_using_get},
      url: "/api/snapshots/#{snapshotId}/paths",
      method: :get,
      query: query,
      response: [{200, {FwdClient.PathSearchResponse, :t}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Searches for paths by tracing packets through the network

  ## Options

    * `srcIp`: the source IP address or subnet of packets entering the network. For multicast (*, G) paths, set srcIp = G (multicast group address).
    * `dstIp`: the destination IP address or subnet of packets entering the network. For multicast (*, G) paths, set dstIp = G (multicast group address).
    * `intent`: Specifies the intent for the search. Default PREFER_DELIVERED.
      *PREFER_VIOLATIONS*: Prefer paths that result in the traffic not getting delivered, e.g. drops, blackholes, loops. An example usage is while trying to evaluate if the specified traffic always gets delivered to the destination along all path choices.
      *PREFER_DELIVERED*: Prefer paths that result in the traffic getting delivered. An example usage is while trying to evaluate if traffic gets delivered to the destination along any path choice.
      *VIOLATIONS_ONLY*: Search for paths where traffic is not delivered to the destination.
    * `ipProto`: the IP protocol
    * `srcPort`: the L4 source port, like "80" or a range "8080-8088"
    * `dstPort`: the L4 destination port, like "80" or a range "8080-8088"
    * `icmpType`: the ICMP type. Implies ipProto = 1.
    * `fin`: the FIN (finish) bit (0 or 1). Implies ipProto = 6.
    * `syn`: the SYN (synchronize) bit (0 or 1). Implies ipProto = 6.
    * `rst`: the RST (reset) bit (0 or 1). Implies ipProto = 6.
    * `psh`: the PSH (push) bit (0 or 1). Implies ipProto = 6.
    * `ack`: the ACK (acknowledgment) bit (0 or 1). Implies ipProto = 6.
    * `urg`: the URG (urgent) bit (0 or 1). Implies ipProto = 6.
    * `appId`: the L7 app-id or "unidentified" to exclude paths that traverse firewall policies with app-id matches. If the system doesn't recognize the provided value, it handles the value the same as "unidentified" and includes the value in the `unrecognizedValues` response field. The applications that are recognized by the model can be obtained using GET /api/l7-applications.
    * `userId`: the L7 user-id or "unidentified" to exclude paths that traverse firewall policies with user-id matches. If the system doesn't recognize the provided value, it handles the value the same as "unidentified" and includes the value in the `unrecognizedValues` response field. See [Path Analysis with Layer 7 User-Group](/docs/enterprise/applications/search/path-analysis/layer7_ugroup/) for more info.
    * `userGroupId`: the L7 user-group-id. If the system doesn't recognize the provided value, the search returns 0 results as there are no paths that traverse firewall policies with that user-group-id match, and the value is included in the `unrecognizedValues` response field. See [Path Analysis with Layer 7 User-Group](/docs/enterprise/applications/search/path-analysis/layer7_ugroup/) for more info.
    * `url`: the L7 URL that traffic of interest is trying to access. Prefix wildcards are supported for subdomains. Suffix wildcards are supported for top-level domains and URL paths. See [Path Analysis with Layer 7 URL](/docs/enterprise/applications/search/path-analysis/layer7_url/) for more policy patterns supported in the model.
    * `includeNetworkFunctions`: If true, the response includes detailed forwarding info for each hop.
      Note: Setting this to true increases the API response time.
    * `maxCandidates`: the limit on the number of search results computed, before applying any ranking criteria. Permitted range = 1 to 10,000. Default 5,000.
    * `maxResults`: the limit on the number of search results returned by the API. First, the platform computes up to maxCandidates results that match the search criteria. Then they are sorted by various ranking criteria. A key ranking factor is path length, preferring longer paths (greatest reach) in the network over shorter ones. Finally, the API limits the number of returned search results to maxResults. Permitted range = 1 to maxCandidates. Default 1.
    * `maxReturnPathResults`: the limit on the number of return path search results. Permitted range = 0 to 10,000. Default 0. Multicast (*, G) and (S, G) queries will always return 0 return path results regardless of this value.
    * `maxSeconds`: the timeout duration. Permitted range = 1 to 300. Default 30.
    * `snapshotId`: An optional Snapshot id. If omitted, the network’s latest processed Snapshot is used.

  """
  @spec get_paths_using_get(String.t(), keyword) ::
          {:ok, FwdClient.PathSearchResponse.t()} | {:error, FwdClient.ErrorInfo.t()}
  def get_paths_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :ack,
        :appId,
        :dstIp,
        :dstPort,
        :fin,
        :icmpType,
        :includeNetworkFunctions,
        :intent,
        :ipProto,
        :maxCandidates,
        :maxResults,
        :maxReturnPathResults,
        :maxSeconds,
        :psh,
        :rst,
        :snapshotId,
        :srcIp,
        :srcPort,
        :syn,
        :urg,
        :url,
        :userGroupId,
        :userId
      ])

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.PathSearch, :get_paths_using_get},
      url: "/api/networks/#{networkId}/paths",
      method: :get,
      query: query,
      response: [{200, {FwdClient.PathSearchResponse, :t}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Searches for paths by tracing sets of packets through the network

  This operation was deprecated in release 23.9. Please switch to POST /networks/{networkId}/paths-bulk-seq[?snapshotId={snapshotId}] before release 23.12.
  """
  @spec get_trace_paths_bulk_seq_by_snapshot_using_post(
          String.t(),
          FwdClient.PathSearchBulkRequest.t(),
          keyword
        ) :: {:ok, FwdClient.PathSearchResponse.t()} | {:error, FwdClient.ErrorInfo.t()}
  def get_trace_paths_bulk_seq_by_snapshot_using_post(snapshotId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, body: body],
      call: {FwdClient.PathSearch, :get_trace_paths_bulk_seq_by_snapshot_using_post},
      url: "/api/snapshots/#{snapshotId}/pathsBulkSeq",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.PathSearchBulkRequest, :t}}],
      response: [
        {200, {FwdClient.PathSearchResponse, :t}},
        {400, :null},
        {409, {FwdClient.ErrorInfo, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Searches for paths by tracing sets of packets through the network

  ## Options

    * `snapshotId`: An optional Snapshot id. If omitted, the network’s latest processed Snapshot is used.

  """
  @spec get_trace_paths_bulk_seq_using_post(
          String.t(),
          FwdClient.PathSearchBulkRequest.t(),
          keyword
        ) :: {:ok, FwdClient.PathSearchResponse.t()} | {:error, FwdClient.ErrorInfo.t()}
  def get_trace_paths_bulk_seq_using_post(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:snapshotId])

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.PathSearch, :get_trace_paths_bulk_seq_using_post},
      url: "/api/networks/#{networkId}/paths-bulk-seq",
      body: body,
      method: :post,
      query: query,
      request: [{"application/json", {FwdClient.PathSearchBulkRequest, :t}}],
      response: [
        {200, {FwdClient.PathSearchResponse, :t}},
        {400, :null},
        {409, {FwdClient.ErrorInfo, :t}}
      ],
      opts: opts
    })
  end
end
