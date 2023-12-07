defmodule FwdClient.ClientTest do
  use ExUnit.Case, async: true
  use FwdClient.Testing

  describe "request/1" do
    #   setup :attach_telemetry

    test "Test Get Networks" do
      assert {:ok, _} = FwdClient.Networks.get_networks_using_get()
    end

    test "Test Get Snapshots Error" do
      assert {:error, _} =
               FwdClient.NetworkSnapshots.get_latest_processed_snapshot_using_get("101")
    end

    test "Test Get Snapshots Success" do
      assert {:ok, %FwdClient.SnapshotInfo{state: "PROCESSED"}} =
               FwdClient.NetworkSnapshots.get_latest_processed_snapshot_using_get("137847")
    end

    test "Test Get Snapshot Metrics" do
      case FwdClient.NetworkSnapshots.get_latest_processed_snapshot_using_get("137847") do
        {:ok, %FwdClient.SnapshotInfo{id: id}} ->
          result = FwdClient.NetworkSnapshots.get_snapshot_metrics_using_get(id)
          assert {:ok, %FwdClient.SnapshotMetrics{pathSearchIndexingStatus: "SUCCESS"}} = result
      end
    end
  end
end
