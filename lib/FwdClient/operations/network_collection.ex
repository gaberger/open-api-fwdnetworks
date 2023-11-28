defmodule FwdClient.NetworkCollection do
  @moduledoc """
  Provides API endpoints related to network collection
  """

  @default_client FwdClient.Client

  @doc """
  Adds a network collection schedule
  """
  @spec add_collection_schedule_using_post(
          String.t(),
          FwdClient.CollectionScheduleDefinition.t(),
          keyword
        ) :: {:ok, FwdClient.CollectionSchedule.t()} | :error
  def add_collection_schedule_using_post(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkCollection, :add_collection_schedule_using_post},
      url: "/api/networks/#{networkId}/collection-schedules",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.CollectionScheduleDefinition, :t}}],
      response: [{200, {FwdClient.CollectionSchedule, :t}}],
      opts: opts
    })
  end

  @doc """
  Cancels an in-progress network collection

  ## Options

    * `force`: force

  """
  @spec cancel_collect_using_post(String.t(), keyword) ::
          {:ok, FwdClient.EmptyObject.t()} | :error
  def cancel_collect_using_post(networkId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:force])

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkCollection, :cancel_collect_using_post},
      url: "/api/networks/#{networkId}/cancelcollection",
      method: :post,
      query: query,
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Triggers a network collection
  """
  @spec collect_using_post(String.t(), keyword) :: {:ok, FwdClient.EmptyObject.t()} | :error
  def collect_using_post(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkCollection, :collect_using_post},
      url: "/api/networks/#{networkId}/startcollection",
      method: :post,
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes a network collection schedule
  """
  @spec delete_collection_schedule_using_delete(String.t(), String.t(), keyword) :: :ok | :error
  def delete_collection_schedule_using_delete(networkId, scheduleId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, scheduleId: scheduleId],
      call: {FwdClient.NetworkCollection, :delete_collection_schedule_using_delete},
      url: "/api/networks/#{networkId}/collection-schedules/#{scheduleId}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Gets a network collection schedule
  """
  @spec get_collection_schedule_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.CollectionSchedule.t()} | :error
  def get_collection_schedule_using_get(networkId, scheduleId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, scheduleId: scheduleId],
      call: {FwdClient.NetworkCollection, :get_collection_schedule_using_get},
      url: "/api/networks/#{networkId}/collection-schedules/#{scheduleId}",
      method: :get,
      response: [{200, {FwdClient.CollectionSchedule, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network’s collection schedules
  """
  @spec get_collection_schedules_using_get(String.t(), keyword) ::
          {:ok, FwdClient.CollectionSchedules.t()} | :error
  def get_collection_schedules_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkCollection, :get_collection_schedules_using_get},
      url: "/api/networks/#{networkId}/collection-schedules",
      method: :get,
      response: [{200, {FwdClient.CollectionSchedules, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets the status of a network’s collector
  """
  @spec get_collector_state_using_get(String.t(), keyword) ::
          {:ok, FwdClient.CollectorState.t()} | :error
  def get_collector_state_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkCollection, :get_collector_state_using_get},
      url: "/api/networks/#{networkId}/collector/status",
      method: :get,
      response: [{200, {FwdClient.CollectorState, :t}}],
      opts: opts
    })
  end

  @doc """
  Replaces a network collection schedule
  """
  @spec replace_collection_schedule_using_put(
          String.t(),
          String.t(),
          FwdClient.CollectionSchedule.t(),
          keyword
        ) :: {:ok, FwdClient.EmptyObject.t()} | :error
  def replace_collection_schedule_using_put(networkId, scheduleId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, scheduleId: scheduleId, body: body],
      call: {FwdClient.NetworkCollection, :replace_collection_schedule_using_put},
      url: "/api/networks/#{networkId}/collection-schedules/#{scheduleId}",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.CollectionSchedule, :t}}],
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end
end
