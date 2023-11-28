defmodule FwdClient.Networks do
  @moduledoc """
  Provides API endpoints related to networks
  """

  @default_client FwdClient.Client

  @doc """
  Creates a network

  ## Options

    * `name`: name

  """
  @spec create_network_using_post(keyword) :: {:ok, FwdClient.Network.t()} | :error
  def create_network_using_post(opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:name])

    client.request(%{
      args: [],
      call: {FwdClient.Networks, :create_network_using_post},
      url: "/api/networks",
      method: :post,
      query: query,
      response: [{200, {FwdClient.Network, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates a Workspace network

  A <a class="fn-external-link" target="_blank" href="/docs/enterprise/applications/change-mgmt/workspace_network/">Workspace network</a> is a network that collects from only a subset of the devices in a large “parent” network. This kind of network can be useful in time-sensitive situations like change management windows.
  """
  @spec create_workspace_network_using_post(
          String.t(),
          FwdClient.CreateWorkspaceNetworkRequest.t(),
          keyword
        ) :: {:ok, FwdClient.Network.t()} | :error
  def create_workspace_network_using_post(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.Networks, :create_workspace_network_using_post},
      url: "/api/networks/#{networkId}/workspaces",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.CreateWorkspaceNetworkRequest, :t}}],
      response: [{200, {FwdClient.Network, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes a network
  """
  @spec delete_network_using_delete(String.t(), keyword) :: {:ok, FwdClient.Network.t()} | :error
  def delete_network_using_delete(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.Networks, :delete_network_using_delete},
      url: "/api/networks/#{networkId}",
      method: :delete,
      response: [{200, {FwdClient.Network, :t}}],
      opts: opts
    })
  end

  @doc """
  Lists all networks
  """
  @spec get_networks_using_get(keyword) :: {:ok, [FwdClient.Network.t()]} | :error
  def get_networks_using_get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {FwdClient.Networks, :get_networks_using_get},
      url: "/api/networks",
      method: :get,
      response: [{200, [{FwdClient.Network, :t}]}],
      opts: opts
    })
  end

  @doc """
  Renames a network
  """
  @spec update_network_using_patch(String.t(), FwdClient.NetworkUpdate.t(), keyword) ::
          {:ok, FwdClient.Network.t()} | :error
  def update_network_using_patch(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.Networks, :update_network_using_patch},
      url: "/api/networks/#{networkId}",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.NetworkUpdate, :t}}],
      response: [{200, {FwdClient.Network, :t}}],
      opts: opts
    })
  end
end
