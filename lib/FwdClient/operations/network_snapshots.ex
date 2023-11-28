defmodule FwdClient.NetworkSnapshots do
  @moduledoc """
  Provides API endpoints related to network snapshots
  """

  @default_client FwdClient.Client

  @doc """
  Imports a Snapshot

  Imports a network Snapshot that was previously exported as a .zip file. If multiple Snapshot .zip files are uploaded in a single request, they will be merged. They must not have any devices in common.
  """
  @spec create_snapshot_using_post(String.t(), FwdClient.NetworkIdSnapshotsBody.t(), keyword) ::
          {:ok, FwdClient.SnapshotInfo.t()} | :error
  def create_snapshot_using_post(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkSnapshots, :create_snapshot_using_post},
      url: "/api/networks/#{networkId}/snapshots",
      body: body,
      method: :post,
      request: [{"multipart/form-data", {FwdClient.NetworkIdSnapshotsBody, :t}}],
      response: [{200, {FwdClient.SnapshotInfo, :t}}],
      opts: opts
    })
  end

  @doc """
  Exports a Snapshot subset, optionally obfuscated

  Exports a network Snapshot as a .zip file, optionally limiting which devices are included and optionally [obfuscating](/docs/administration/system/obfuscate-snapshot/) sensitive data.

  To limit which devices are included, specify either `"includeDevices"` or `"excludeDevices"`. To obfuscate, specify an `"obfuscationKey"`.
  """
  @spec custom_zip_snapshot_using_post(String.t(), FwdClient.SnapshotExportParams.t(), keyword) ::
          :ok | :error
  def custom_zip_snapshot_using_post(snapshotId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId, body: body],
      call: {FwdClient.NetworkSnapshots, :custom_zip_snapshot_using_post},
      url: "/api/snapshots/#{snapshotId}",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.SnapshotExportParams, :t}}],
      response: [{200, :null}],
      opts: opts
    })
  end

  @doc """
  Deletes a Snapshot
  """
  @spec delete_snapshot_using_delete(String.t(), keyword) ::
          {:ok, FwdClient.EmptyObject.t()} | :error
  def delete_snapshot_using_delete(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.NetworkSnapshots, :delete_snapshot_using_delete},
      url: "/api/snapshots/#{snapshotId}",
      method: :delete,
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Returns the latest processed Snapshot

  Returns the latest processed Snapshot (the most recent one that's currently prepared for [path searches](#path-search) and [new checks](#checks)).

  Triggers processing of the latest Snapshot if it's not already underway and the network has no processed Snapshots.
  """
  @spec get_latest_processed_snapshot_using_get(String.t(), keyword) ::
          {:ok, FwdClient.SnapshotInfo.t()} | {:error, FwdClient.ErrorInfo.t()}
  def get_latest_processed_snapshot_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkSnapshots, :get_latest_processed_snapshot_using_get},
      url: "/api/networks/#{networkId}/snapshots/latestProcessed",
      method: :get,
      response: [
        {200, {FwdClient.SnapshotInfo, :t}},
        {404, :null},
        {409, {FwdClient.ErrorInfo, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Returns the metrics of a Snapshot

  Returns collection and processing health metrics of a Snapshot.
  """
  @spec get_snapshot_metrics_using_get(String.t(), keyword) ::
          {:ok, FwdClient.SnapshotMetrics.t()} | :error
  def get_snapshot_metrics_using_get(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.NetworkSnapshots, :get_snapshot_metrics_using_get},
      url: "/api/snapshots/#{snapshotId}/metrics",
      method: :get,
      response: [{200, {FwdClient.SnapshotMetrics, :t}}, {404, :null}],
      opts: opts
    })
  end

  @doc """
  Lists all Snapshots

  ## Options

    * `state`: List only Snapshots in this state.
    * `minSuccessfulDevices`: List only Snapshots with at least this many successfully modeled devices.
    * `minSuccessfulDevicePct`: List only Snapshots with at least this percentage of devices successfully modeled.
    * `maxCollectionFailureDevices`: List only Snapshots with no more than this many devices from which collection has failed.
    * `maxCollectionFailureDevicePct`: List only Snapshots with no more than this percentage of devices from which collection has failed.
    * `maxParsingFailureDevices`: List only Snapshots with no more than this many devices for which parsing of collected data has failed.
    * `maxParsingFailureDevicePct`: List only Snapshots with no more than this percentage of devices for which parsing of collected data has failed.
    * `limit`: Maximum number of Snapshots desired

  """
  @spec list_network_snapshots_using_get(String.t(), keyword) :: {:ok, map} | :error
  def list_network_snapshots_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :limit,
        :maxCollectionFailureDevicePct,
        :maxCollectionFailureDevices,
        :maxParsingFailureDevicePct,
        :maxParsingFailureDevices,
        :minSuccessfulDevicePct,
        :minSuccessfulDevices,
        :state
      ])

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkSnapshots, :list_network_snapshots_using_get},
      url: "/api/networks/#{networkId}/snapshots",
      method: :get,
      query: query,
      response: [{200, :map}],
      opts: opts
    })
  end

  @doc """
  Exports a Snapshot

  Exports a network Snapshot as a .zip file.
  """
  @spec zip_snapshot_using_get(String.t(), keyword) :: :ok | :error
  def zip_snapshot_using_get(snapshotId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [snapshotId: snapshotId],
      call: {FwdClient.NetworkSnapshots, :zip_snapshot_using_get},
      url: "/api/snapshots/#{snapshotId}",
      method: :get,
      response: [{200, :null}],
      opts: opts
    })
  end
end
