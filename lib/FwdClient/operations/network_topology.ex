defmodule FwdClient.NetworkTopology do
  @moduledoc """
  Provides API endpoints related to network topology
  """

  @default_client FwdClient.Client

  @doc """
  Gets the topology overrides
  """
  @spec get_snapshot_topo_overrides_using_get(String.t(), keyword) ::
          {:ok, FwdClient.LinkOverrides.t()} | {:error, FwdClient.ErrorInfo.t()}
  def get_snapshot_topo_overrides_using_get(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.NetworkTopology, :get_snapshot_topo_overrides_using_get},
      url: "/api/snapshots/#{snapshotId}/topology/overrides",
      method: :get,
      response: [{200, {FwdClient.LinkOverrides, :t}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets the network topology

  The links in the response are directed, so they generally appear twice—once for each direction.
  """
  @spec get_topology_using_get(String.t(), keyword) ::
          {:ok, [FwdClient.TopologyLink.t()]} | {:error, FwdClient.ErrorInfo.t()}
  def get_topology_using_get(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.NetworkTopology, :get_topology_using_get},
      url: "/api/snapshots/#{snapshotId}/topology",
      method: :get,
      response: [{200, [{FwdClient.TopologyLink, :t}]}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Edits the topology overrides
  """
  @spec post_snapshot_topo_overrides_using_post(
          String.t(),
          FwdClient.LinkOverridesEdit.t(),
          keyword
        ) :: {:ok, FwdClient.EmptyObject.t()} | {:error, FwdClient.ErrorInfo.t()}
  def post_snapshot_topo_overrides_using_post(snapshotId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, body: body],
      call: {FwdClient.NetworkTopology, :post_snapshot_topo_overrides_using_post},
      url: "/api/snapshots/#{snapshotId}/topology/overrides",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.LinkOverridesEdit, :t}}],
      response: [{200, {FwdClient.EmptyObject, :t}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Sets the topology overrides

  Replaces any topology overrides previously saved for the Snapshot.
  """
  @spec put_snapshot_topo_overrides_using_put(String.t(), FwdClient.LinkOverrides.t(), keyword) ::
          {:ok, FwdClient.EmptyObject.t()} | {:error, FwdClient.ErrorInfo.t()}
  def put_snapshot_topo_overrides_using_put(snapshotId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, body: body],
      call: {FwdClient.NetworkTopology, :put_snapshot_topo_overrides_using_put},
      url: "/api/snapshots/#{snapshotId}/topology/overrides",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.LinkOverrides, :t}}],
      response: [{200, {FwdClient.EmptyObject, :t}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Sets the topology overrides

  Applies to the network’s latest Snapshot (if any) and to future collected Snapshots.

  The **links** format is:
  ```
  [
    ["device1", "port1", "device2", "port2"],
    ["device3", "port3", "device4", "port4"],
    ...
  ]
  ```
  Using a `PUT` or `POST` to `/snapshots/{snapshotId}/topology/overrides` is preferred.
  """
  @spec set_network_topo_list_using_put(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.EmptyObject.t()} | :error
  def set_network_topo_list_using_put(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkTopology, :set_network_topo_list_using_put},
      url: "/api/networks/#{networkId}/topology",
      body: body,
      method: :put,
      request: [{"application/json", [[string: :generic]]}],
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end
end
