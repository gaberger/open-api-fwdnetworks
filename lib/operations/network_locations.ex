defmodule FwdClient.NetworkLocations do
  @moduledoc """
  Provides API endpoints related to network locations
  """

  @default_client FwdClient.Client

  @doc """
  Creates a device cluster at a location
  """
  @spec add_device_cluster_using_post(
          String.t(),
          String.t(),
          FwdClient.DeviceCluster.t(),
          keyword
        ) :: :ok | {:error, FwdClient.Error.t()}
  def add_device_cluster_using_post(networkId, locationId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, locationId: locationId, body: body],
      call: {FwdClient.NetworkLocations, :add_device_cluster_using_post},
      url: "/api/networks/#{networkId}/locations/#{locationId}/clusters",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.DeviceCluster, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Creates a network location
  """
  @spec add_location_using_post(String.t(), FwdClient.NewLocation.t(), keyword) ::
          {:ok, FwdClient.Location.t()} | {:error, FwdClient.Error.t()}
  def add_location_using_post(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkLocations, :add_location_using_post},
      url: "/api/networks/#{networkId}/locations",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.NewLocation, :t}}],
      response: [{200, {FwdClient.Location, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes a device cluster
  """
  @spec delete_device_cluster_using_delete(String.t(), String.t(), String.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def delete_device_cluster_using_delete(networkId, locationId, clusterName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, locationId: locationId, clusterName: clusterName],
      call: {FwdClient.NetworkLocations, :delete_device_cluster_using_delete},
      url: "/api/networks/#{networkId}/locations/#{locationId}/clusters/#{clusterName}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Deletes a network location

  When a location with devices is deleted, all of its devices will be unassigned.
  """
  @spec delete_location_using_delete(String.t(), String.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def delete_location_using_delete(networkId, locationId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, locationId: locationId],
      call: {FwdClient.NetworkLocations, :delete_location_using_delete},
      url: "/api/networks/#{networkId}/locations/#{locationId}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Gets device locations

  The response is a JSON object that maps device names to their location ids.

  Sample response: `{"atl-edge-fw01": "2", "ny-edge-fw2": "1"}`
  """
  @spec get_atlas_using_get(String.t(), keyword) :: {:ok, map} | {:error, FwdClient.Error.t()}
  def get_atlas_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkLocations, :get_atlas_using_get},
      url: "/api/networks/#{networkId}/atlas",
      method: :get,
      response: [{200, :map}],
      opts: opts
    })
  end

  @doc """
  Gets a device cluster
  """
  @spec get_device_cluster_using_get(String.t(), String.t(), String.t(), keyword) ::
          {:ok, FwdClient.DeviceCluster.t()} | {:error, FwdClient.Error.t()}
  def get_device_cluster_using_get(networkId, locationId, clusterName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, locationId: locationId, clusterName: clusterName],
      call: {FwdClient.NetworkLocations, :get_device_cluster_using_get},
      url: "/api/networks/#{networkId}/locations/#{locationId}/clusters/#{clusterName}",
      method: :get,
      response: [{200, {FwdClient.DeviceCluster, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets the device clusters at a location
  """
  @spec get_device_clusters_using_get(String.t(), String.t(), keyword) ::
          {:ok, [FwdClient.DeviceCluster.t()]} | {:error, FwdClient.Error.t()}
  def get_device_clusters_using_get(networkId, locationId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, locationId: locationId],
      call: {FwdClient.NetworkLocations, :get_device_clusters_using_get},
      url: "/api/networks/#{networkId}/locations/#{locationId}/clusters",
      method: :get,
      response: [{200, [{FwdClient.DeviceCluster, :t}]}],
      opts: opts
    })
  end

  @doc """
  Gets a network location
  """
  @spec get_location_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.Location.t()} | {:error, FwdClient.Error.t()}
  def get_location_using_get(networkId, locationId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, locationId: locationId],
      call: {FwdClient.NetworkLocations, :get_location_using_get},
      url: "/api/networks/#{networkId}/locations/#{locationId}",
      method: :get,
      response: [{200, {FwdClient.Location, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network’s locations
  """
  @spec get_locations_using_get(String.t(), keyword) ::
          {:ok, [FwdClient.Location.t()]} | {:error, FwdClient.Error.t()}
  def get_locations_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkLocations, :get_locations_using_get},
      url: "/api/networks/#{networkId}/locations",
      method: :get,
      response: [{200, [{FwdClient.Location, :t}]}],
      opts: opts
    })
  end

  @doc """
  Updates a network location
  """
  @spec patch_location_using_patch(String.t(), String.t(), FwdClient.LocationPatch.t(), keyword) ::
          {:ok, FwdClient.Location.t()} | {:error, FwdClient.Error.t()}
  def patch_location_using_patch(networkId, locationId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, locationId: locationId, body: body],
      call: {FwdClient.NetworkLocations, :patch_location_using_patch},
      url: "/api/networks/#{networkId}/locations/#{locationId}",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.LocationPatch, :t}}],
      response: [{200, {FwdClient.Location, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates or updates network locations

  Any patches that specify an existing location’s `id` will update the existing location. Any other patches will each create a new location. Patches are applied sequentially.
  """
  @spec patch_locations_using_patch(String.t(), FwdClient.LocationBulkPatch.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def patch_locations_using_patch(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkLocations, :patch_locations_using_patch},
      url: "/api/networks/#{networkId}/locations",
      body: body,
      method: :patch,
      request: [{"application/json", [{FwdClient.LocationBulkPatch, :t}]}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Replaces all device clusters at a location
  """
  @spec put_device_clusters_using_put(
          String.t(),
          String.t(),
          FwdClient.DeviceCluster.t(),
          keyword
        ) :: :ok | {:error, FwdClient.Error.t()}
  def put_device_clusters_using_put(networkId, locationId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, locationId: locationId, body: body],
      call: {FwdClient.NetworkLocations, :put_device_clusters_using_put},
      url: "/api/networks/#{networkId}/locations/#{locationId}/clusters",
      body: body,
      method: :put,
      request: [{"application/json", [{FwdClient.DeviceCluster, :t}]}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Creates network locations

  Creates multiple locations at once. Can be helpful when first setting up a network.

  Fails (as a precautionary measure) with 409 Conflict if the network already has any network locations.
  """
  @spec put_locations_using_put(String.t(), FwdClient.Location.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_locations_using_put(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkLocations, :put_locations_using_put},
      url: "/api/networks/#{networkId}/locations",
      body: body,
      method: :put,
      request: [{"application/json", [{FwdClient.Location, :t}]}],
      response: [{204, :null}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Updates device locations

  The request is a JSON object that maps device names to their new location ids.

  Sample request: `{"atl-edge-fw01": "2", "ny-edge-fw2": "1"}`
  """
  @spec update_atlas_using_patch(String.t(), map, keyword) :: :ok | {:error, FwdClient.Error.t()}
  def update_atlas_using_patch(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkLocations, :update_atlas_using_patch},
      url: "/api/networks/#{networkId}/atlas",
      body: body,
      method: :patch,
      request: [{"application/json", :map}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Updates a device cluster
  """
  @spec update_device_cluster_using_patch(
          String.t(),
          String.t(),
          String.t(),
          FwdClient.DeviceClusterUpdate.t(),
          keyword
        ) :: :ok | {:error, FwdClient.Error.t()}
  def update_device_cluster_using_patch(networkId, locationId, clusterName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, locationId: locationId, clusterName: clusterName, body: body],
      call: {FwdClient.NetworkLocations, :update_device_cluster_using_patch},
      url: "/api/networks/#{networkId}/locations/#{locationId}/clusters/#{clusterName}",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.DeviceClusterUpdate, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end
end
