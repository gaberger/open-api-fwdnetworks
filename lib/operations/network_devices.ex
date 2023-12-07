defmodule FwdClient.NetworkDevices do
  @moduledoc """
  Provides API endpoints related to network devices
  """

  @default_client FwdClient.Client

  @doc """
  Gets device data file content

  Most device data files are text files. Some are binary. A file’s extension indicates its type.

  For convenience, the .txt file extension is optional (can be omitted).
  """
  @spec get_device_file_content_using_get(String.t(), String.t(), String.t(), keyword) ::
          {:ok, String.t()} | {:error, FwdClient.Error.t()}
  def get_device_file_content_using_get(snapshotId, deviceName, fileName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, deviceName: deviceName, fileName: fileName],
      call: {FwdClient.NetworkDevices, :get_device_file_content_using_get},
      url: "/api/snapshots/#{snapshotId}/devices/#{deviceName}/files/#{fileName}",
      method: :get,
      response: [{200, {:string, :generic}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Lists a device’s data files
  """
  @spec get_device_files_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.DeviceFiles.t()} | {:error, FwdClient.Error.t()}
  def get_device_files_using_get(snapshotId, deviceName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, deviceName: deviceName],
      call: {FwdClient.NetworkDevices, :get_device_files_using_get},
      url: "/api/snapshots/#{snapshotId}/devices/#{deviceName}/files",
      method: :get,
      response: [{200, {FwdClient.DeviceFiles, :t}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network’s devices

  This operation was deprecated in release 23.11. Please switch to GET /networks/{networkId}/devices[?snapshotId={snapshotId}] before release 24.2.

  All glob filter parameters ignore case and support [the common glob wildcards](https://en.wikipedia.org/wiki/Glob_(programming)#Syntax) (`*`, `?`, `[abc]`, `[a-z]`).

  ## Options

    * `name`: `"name"` glob filter
    * `displayName`: `"displayName"` glob filter. Use `?displayName=` to request devices that have no `"displayName"` property (because it’s the same as `"name"`).
    * `sourceName`: `"sourceName"` glob filter. Use `?sourceName=` to request devices that have no `"sourceName"` property (because it’s the same as `"name"`).
    * `type`: `"type"` glob filter
    * `vendor`: `"vendor"` glob filter
    * `model`: `"model"` glob filter. Use `?model=` to request devices with no `"model"` property.
    * `platform`: `"platform"` glob filter
    * `osVersion`: `"osVersion"` glob filter. Use `?osVersion=` to request devices with no `"osVersion"` property.
    * `collectionError`: `"collectionError"` glob filter. Use `?collectionError=` to request devices with no `"collectionError"` property (because collection succeeded). Use `?collectionError=*` to request devices that had a collection error of any kind.
    * `processingError`: `"processingError"` glob filter. Use `?processingError=` to request devices with no `"processingError"` property (because processing succeeded). Use `?processingError=*` to request devices that had a processing error of any kind.
    * `skip`: Number of devices to skip (for paging)
    * `limit`: Maximum number of devices desired

  """
  @spec get_devices_by_snapshot_using_get(String.t(), keyword) ::
          {:ok, [FwdClient.Device.t()]} | {:error, FwdClient.Error.t()}
  def get_devices_by_snapshot_using_get(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :collectionError,
        :displayName,
        :limit,
        :model,
        :name,
        :osVersion,
        :platform,
        :processingError,
        :skip,
        :sourceName,
        :type,
        :vendor
      ])

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.NetworkDevices, :get_devices_by_snapshot_using_get},
      url: "/api/snapshots/#{snapshotId}/devices",
      method: :get,
      query: query,
      response: [{200, [{FwdClient.Device, :t}]}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network’s devices

  All glob filter parameters ignore case and support [the common glob wildcards](https://en.wikipedia.org/wiki/Glob_(programming)#Syntax) (`*`, `?`, `[abc]`, `[a-z]`).

  ## Options

    * `name`: `"name"` glob filter
    * `displayName`: `"displayName"` glob filter. Use `?displayName=` to request devices that have no `"displayName"` property (because it’s the same as `"name"`).
    * `sourceName`: `"sourceName"` glob filter. Use `?sourceName=` to request devices that have no `"sourceName"` property (because it’s the same as `"name"`).
    * `type`: `"type"` glob filter
    * `vendor`: `"vendor"` glob filter
    * `model`: `"model"` glob filter. Use `?model=` to request devices with no `"model"` property.
    * `platform`: `"platform"` glob filter
    * `osVersion`: `"osVersion"` glob filter. Use `?osVersion=` to request devices with no `"osVersion"` property.
    * `collectionError`: `"collectionError"` glob filter. Use `?collectionError=` to request devices with no `"collectionError"` property (because collection succeeded). Use `?collectionError=*` to request devices that had a collection error of any kind.
    * `processingError`: `"processingError"` glob filter. Use `?processingError=` to request devices with no `"processingError"` property (because processing succeeded). Use `?processingError=*` to request devices that had a processing error of any kind.
    * `skip`: Number of devices to skip (for paging)
    * `limit`: Maximum number of devices desired
    * `snapshotId`: An optional Snapshot id. If omitted, the network’s latest processed Snapshot is used.

  """
  @spec get_devices_using_get(String.t(), keyword) ::
          {:ok, [FwdClient.Device.t()]} | {:error, FwdClient.Error.t()}
  def get_devices_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :collectionError,
        :displayName,
        :limit,
        :model,
        :name,
        :osVersion,
        :platform,
        :processingError,
        :skip,
        :snapshotId,
        :sourceName,
        :type,
        :vendor
      ])

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkDevices, :get_devices_using_get},
      url: "/api/networks/#{networkId}/devices",
      method: :get,
      query: query,
      response: [{200, [{FwdClient.Device, :t}]}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network’s missing devices

  Returns devices that are listed as CDP/LLDP neighbors of modeled devices but that aren’t yet included in the network model.
  """
  @spec get_missing_devices_using_get(String.t(), keyword) ::
          {:ok, FwdClient.MissingDevices.t()} | {:error, FwdClient.Error.t()}
  def get_missing_devices_using_get(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.NetworkDevices, :get_missing_devices_using_get},
      url: "/api/snapshots/#{snapshotId}/missingDevices",
      method: :get,
      response: [{200, {FwdClient.MissingDevices, :t}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network device
  """
  @spec get_one_device_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.Device.t()} | {:error, FwdClient.Error.t()}
  def get_one_device_using_get(snapshotId, deviceName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, deviceName: deviceName],
      call: {FwdClient.NetworkDevices, :get_one_device_using_get},
      url: "/api/snapshots/#{snapshotId}/devices/#{deviceName}",
      method: :get,
      response: [{200, {FwdClient.Device, :t}}, {409, {FwdClient.ErrorInfo, :t}}],
      opts: opts
    })
  end
end
