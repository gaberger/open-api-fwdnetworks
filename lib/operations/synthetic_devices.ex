defmodule FwdClient.SyntheticDevices do
  @moduledoc """
  Provides API endpoints related to synthetic devices
  """

  @default_client FwdClient.Client

  @doc """
  Adds a connection to the internet node
  """
  @spec add_internet_node_connection_using_post(String.t(), FwdClient.InetConnection.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def add_internet_node_connection_using_post(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.SyntheticDevices, :add_internet_node_connection_using_post},
      url: "/api/networks/#{networkId}/internet-node/connections",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.InetConnection, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Adds a connection to an intranet node
  """
  @spec add_intranet_node_connection_using_post(
          String.t(),
          String.t(),
          FwdClient.InetConnection.t(),
          keyword
        ) :: :ok | {:error, FwdClient.Error.t()}
  def add_intranet_node_connection_using_post(networkId, nodeName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, nodeName: nodeName, body: body],
      call: {FwdClient.SyntheticDevices, :add_intranet_node_connection_using_post},
      url: "/api/networks/#{networkId}/intranet-nodes/#{nodeName}/connections",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.InetConnection, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Adds a connection to an L2VPN
  """
  @spec add_l2_vpn_connection_using_post(
          String.t(),
          String.t(),
          FwdClient.L2VpnConnection.t(),
          keyword
        ) :: :ok | {:error, FwdClient.Error.t()}
  def add_l2_vpn_connection_using_post(networkId, l2VpnName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, l2VpnName: l2VpnName, body: body],
      call: {FwdClient.SyntheticDevices, :add_l2_vpn_connection_using_post},
      url: "/api/networks/#{networkId}/l2-vpns/#{l2VpnName}/connections",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.L2VpnConnection, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Adds a connection to an L3VPN
  """
  @spec add_l3_vpn_connection_using_post(
          String.t(),
          String.t(),
          FwdClient.L3VpnConnection.t(),
          keyword
        ) :: :ok | {:error, FwdClient.Error.t()}
  def add_l3_vpn_connection_using_post(networkId, l3VpnName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, l3VpnName: l3VpnName, body: body],
      call: {FwdClient.SyntheticDevices, :add_l3_vpn_connection_using_post},
      url: "/api/networks/#{networkId}/l3-vpns/#{l3VpnName}/connections",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.L3VpnConnection, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Removes an encryptor
  """
  @spec delete_encryptor_using_delete(String.t(), String.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def delete_encryptor_using_delete(networkId, deviceName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, deviceName: deviceName],
      call: {FwdClient.SyntheticDevices, :delete_encryptor_using_delete},
      url: "/api/networks/#{networkId}/encryptors/#{deviceName}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Removes internet node connections

  ## Options

    * `uplinkDevice`: uplinkDevice
    * `uplinkPort`: uplinkPort
    * `gatewayDevice`: gatewayDevice
    * `gatewayPort`: gatewayPort
    * `vlan`: vlan

  """
  @spec delete_internet_node_connections_using_delete(String.t(), keyword) ::
          {:ok, FwdClient.SyntheticConnections.t()} | {:error, FwdClient.Error.t()}
  def delete_internet_node_connections_using_delete(networkId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:gatewayDevice, :gatewayPort, :uplinkDevice, :uplinkPort, :vlan])

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.SyntheticDevices, :delete_internet_node_connections_using_delete},
      url: "/api/networks/#{networkId}/internet-node/connections",
      method: :delete,
      query: query,
      response: [{200, {FwdClient.SyntheticConnections, :t}}],
      opts: opts
    })
  end

  @doc """
  Removes an intranet node’s connections

  ## Options

    * `uplinkDevice`: uplinkDevice
    * `uplinkPort`: uplinkPort
    * `gatewayDevice`: gatewayDevice
    * `gatewayPort`: gatewayPort
    * `vlan`: vlan

  """
  @spec delete_intranet_node_connections_using_delete(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.SyntheticConnections.t()} | {:error, FwdClient.Error.t()}
  def delete_intranet_node_connections_using_delete(networkId, nodeName, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:gatewayDevice, :gatewayPort, :uplinkDevice, :uplinkPort, :vlan])

    client.request(%{
      args: [networkId: networkId, nodeName: nodeName],
      call: {FwdClient.SyntheticDevices, :delete_intranet_node_connections_using_delete},
      url: "/api/networks/#{networkId}/intranet-nodes/#{nodeName}/connections",
      method: :delete,
      query: query,
      response: [{200, {FwdClient.SyntheticConnections, :t}}],
      opts: opts
    })
  end

  @doc """
  Removes an intranet node
  """
  @spec delete_intranet_node_using_delete(String.t(), String.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def delete_intranet_node_using_delete(networkId, nodeName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, nodeName: nodeName],
      call: {FwdClient.SyntheticDevices, :delete_intranet_node_using_delete},
      url: "/api/networks/#{networkId}/intranet-nodes/#{nodeName}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Removes an L2VPN’s connections

  ## Options

    * `device`: device
    * `port`: port
    * `vlan`: vlan

  """
  @spec delete_l2_vpn_connections_using_delete(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.SyntheticConnections.t()} | {:error, FwdClient.Error.t()}
  def delete_l2_vpn_connections_using_delete(networkId, l2VpnName, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:device, :port, :vlan])

    client.request(%{
      args: [networkId: networkId, l2VpnName: l2VpnName],
      call: {FwdClient.SyntheticDevices, :delete_l2_vpn_connections_using_delete},
      url: "/api/networks/#{networkId}/l2-vpns/#{l2VpnName}/connections",
      method: :delete,
      query: query,
      response: [{200, {FwdClient.SyntheticConnections, :t}}],
      opts: opts
    })
  end

  @doc """
  Removes an L2VPN
  """
  @spec delete_l2_vpn_using_delete(String.t(), String.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def delete_l2_vpn_using_delete(networkId, l2VpnName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, l2VpnName: l2VpnName],
      call: {FwdClient.SyntheticDevices, :delete_l2_vpn_using_delete},
      url: "/api/networks/#{networkId}/l2-vpns/#{l2VpnName}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Removes an L3VPN’s connections

  ## Options

    * `uplinkDevice`: uplinkDevice
    * `uplinkPort`: uplinkPort
    * `gatewayDevice`: gatewayDevice
    * `gatewayPort`: gatewayPort
    * `vlan`: vlan

  """
  @spec delete_l3_vpn_connections_using_delete(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.SyntheticConnections.t()} | {:error, FwdClient.Error.t()}
  def delete_l3_vpn_connections_using_delete(networkId, l3VpnName, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:gatewayDevice, :gatewayPort, :uplinkDevice, :uplinkPort, :vlan])

    client.request(%{
      args: [networkId: networkId, l3VpnName: l3VpnName],
      call: {FwdClient.SyntheticDevices, :delete_l3_vpn_connections_using_delete},
      url: "/api/networks/#{networkId}/l3-vpns/#{l3VpnName}/connections",
      method: :delete,
      query: query,
      response: [{200, {FwdClient.SyntheticConnections, :t}}],
      opts: opts
    })
  end

  @doc """
  Removes an L3VPN
  """
  @spec delete_l3_vpn_using_delete(String.t(), String.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def delete_l3_vpn_using_delete(networkId, l3VpnName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, l3VpnName: l3VpnName],
      call: {FwdClient.SyntheticDevices, :delete_l3_vpn_using_delete},
      url: "/api/networks/#{networkId}/l3-vpns/#{l3VpnName}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Removes a WAN circuit
  """
  @spec delete_wan_circuit_using_delete(String.t(), String.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def delete_wan_circuit_using_delete(networkId, wanCircuitName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, wanCircuitName: wanCircuitName],
      call: {FwdClient.SyntheticDevices, :delete_wan_circuit_using_delete},
      url: "/api/networks/#{networkId}/wan-circuits/#{wanCircuitName}",
      method: :delete,
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Gets an encryptor
  """
  @spec get_encryptor_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.Encryptor.t()} | {:error, FwdClient.Error.t()}
  def get_encryptor_using_get(networkId, deviceName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, deviceName: deviceName],
      call: {FwdClient.SyntheticDevices, :get_encryptor_using_get},
      url: "/api/networks/#{networkId}/encryptors/#{deviceName}",
      method: :get,
      response: [{200, {FwdClient.Encryptor, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network's encryptors
  """
  @spec get_encryptors_using_get(String.t(), keyword) ::
          {:ok, FwdClient.EncryptorList.t()} | {:error, FwdClient.Error.t()}
  def get_encryptors_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.SyntheticDevices, :get_encryptors_using_get},
      url: "/api/networks/#{networkId}/encryptors",
      method: :get,
      response: [{200, {FwdClient.EncryptorList, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets some internet node connections

  ## Options

    * `uplinkDevice`: uplinkDevice
    * `uplinkPort`: uplinkPort
    * `gatewayDevice`: gatewayDevice
    * `gatewayPort`: gatewayPort
    * `vlan`: vlan

  """
  @spec get_internet_node_connections_using_get(String.t(), keyword) ::
          {:ok, FwdClient.SyntheticConnections.t()} | {:error, FwdClient.Error.t()}
  def get_internet_node_connections_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:gatewayDevice, :gatewayPort, :uplinkDevice, :uplinkPort, :vlan])

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.SyntheticDevices, :get_internet_node_connections_using_get},
      url: "/api/networks/#{networkId}/internet-node/connections",
      method: :get,
      query: query,
      response: [{200, {FwdClient.SyntheticConnections, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets the network’s internet node
  """
  @spec get_internet_node_using_get(String.t(), keyword) ::
          {:ok, FwdClient.InternetNode.t()} | {:error, FwdClient.Error.t()}
  def get_internet_node_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.SyntheticDevices, :get_internet_node_using_get},
      url: "/api/networks/#{networkId}/internet-node",
      method: :get,
      response: [{200, {FwdClient.InternetNode, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets an intranet node’s connections

  ## Options

    * `uplinkDevice`: uplinkDevice
    * `uplinkPort`: uplinkPort
    * `gatewayDevice`: gatewayDevice
    * `gatewayPort`: gatewayPort
    * `vlan`: vlan

  """
  @spec get_intranet_node_connections_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.SyntheticConnections.t()} | {:error, FwdClient.Error.t()}
  def get_intranet_node_connections_using_get(networkId, nodeName, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:gatewayDevice, :gatewayPort, :uplinkDevice, :uplinkPort, :vlan])

    client.request(%{
      args: [networkId: networkId, nodeName: nodeName],
      call: {FwdClient.SyntheticDevices, :get_intranet_node_connections_using_get},
      url: "/api/networks/#{networkId}/intranet-nodes/#{nodeName}/connections",
      method: :get,
      query: query,
      response: [{200, {FwdClient.SyntheticConnections, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets an intranet node
  """
  @spec get_intranet_node_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.IntranetNode.t()} | {:error, FwdClient.Error.t()}
  def get_intranet_node_using_get(networkId, nodeName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, nodeName: nodeName],
      call: {FwdClient.SyntheticDevices, :get_intranet_node_using_get},
      url: "/api/networks/#{networkId}/intranet-nodes/#{nodeName}",
      method: :get,
      response: [{200, {FwdClient.IntranetNode, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network’s intranet nodes
  """
  @spec get_intranet_nodes_using_get(String.t(), keyword) ::
          {:ok, FwdClient.IntranetNodeList.t()} | {:error, FwdClient.Error.t()}
  def get_intranet_nodes_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.SyntheticDevices, :get_intranet_nodes_using_get},
      url: "/api/networks/#{networkId}/intranet-nodes",
      method: :get,
      response: [{200, {FwdClient.IntranetNodeList, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets an L2VPN’s connections

  ## Options

    * `device`: device
    * `port`: port
    * `vlan`: vlan

  """
  @spec get_l2_vpn_connections_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.SyntheticConnections.t()} | {:error, FwdClient.Error.t()}
  def get_l2_vpn_connections_using_get(networkId, l2VpnName, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:device, :port, :vlan])

    client.request(%{
      args: [networkId: networkId, l2VpnName: l2VpnName],
      call: {FwdClient.SyntheticDevices, :get_l2_vpn_connections_using_get},
      url: "/api/networks/#{networkId}/l2-vpns/#{l2VpnName}/connections",
      method: :get,
      query: query,
      response: [{200, {FwdClient.SyntheticConnections, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets an L2VPN
  """
  @spec get_l2_vpn_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.L2Vpn.t()} | {:error, FwdClient.Error.t()}
  def get_l2_vpn_using_get(networkId, l2VpnName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, l2VpnName: l2VpnName],
      call: {FwdClient.SyntheticDevices, :get_l2_vpn_using_get},
      url: "/api/networks/#{networkId}/l2-vpns/#{l2VpnName}",
      method: :get,
      response: [{200, {FwdClient.L2Vpn, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network’s L2VPNs
  """
  @spec get_l2_vpns_using_get(String.t(), keyword) ::
          {:ok, FwdClient.L2VpnList.t()} | {:error, FwdClient.Error.t()}
  def get_l2_vpns_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.SyntheticDevices, :get_l2_vpns_using_get},
      url: "/api/networks/#{networkId}/l2-vpns",
      method: :get,
      response: [{200, {FwdClient.L2VpnList, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets an L3VPN’s connections

  ## Options

    * `uplinkDevice`: uplinkDevice
    * `uplinkPort`: uplinkPort
    * `gatewayDevice`: gatewayDevice
    * `gatewayPort`: gatewayPort
    * `vlan`: vlan

  """
  @spec get_l3_vpn_connections_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.SyntheticConnections.t()} | {:error, FwdClient.Error.t()}
  def get_l3_vpn_connections_using_get(networkId, l3VpnName, opts \\ []) do
    client = opts[:client] || @default_client
    query = Keyword.take(opts, [:gatewayDevice, :gatewayPort, :uplinkDevice, :uplinkPort, :vlan])

    client.request(%{
      args: [networkId: networkId, l3VpnName: l3VpnName],
      call: {FwdClient.SyntheticDevices, :get_l3_vpn_connections_using_get},
      url: "/api/networks/#{networkId}/l3-vpns/#{l3VpnName}/connections",
      method: :get,
      query: query,
      response: [{200, {FwdClient.SyntheticConnections, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets an L3VPN
  """
  @spec get_l3_vpn_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.L3Vpn.t()} | {:error, FwdClient.Error.t()}
  def get_l3_vpn_using_get(networkId, l3VpnName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, l3VpnName: l3VpnName],
      call: {FwdClient.SyntheticDevices, :get_l3_vpn_using_get},
      url: "/api/networks/#{networkId}/l3-vpns/#{l3VpnName}",
      method: :get,
      response: [{200, {FwdClient.L3Vpn, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network’s L3VPNs
  """
  @spec get_l3_vpns_using_get(String.t(), keyword) ::
          {:ok, FwdClient.L3VpnList.t()} | {:error, FwdClient.Error.t()}
  def get_l3_vpns_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.SyntheticDevices, :get_l3_vpns_using_get},
      url: "/api/networks/#{networkId}/l3-vpns",
      method: :get,
      response: [{200, {FwdClient.L3VpnList, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a WAN circuit
  """
  @spec get_wan_circuit_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.WanCircuit.t()} | {:error, FwdClient.Error.t()}
  def get_wan_circuit_using_get(networkId, wanCircuitName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, wanCircuitName: wanCircuitName],
      call: {FwdClient.SyntheticDevices, :get_wan_circuit_using_get},
      url: "/api/networks/#{networkId}/wan-circuits/#{wanCircuitName}",
      method: :get,
      response: [{200, {FwdClient.WanCircuit, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network’s WAN circuits
  """
  @spec get_wan_circuits_using_get(String.t(), keyword) ::
          {:ok, FwdClient.WanCircuitList.t()} | {:error, FwdClient.Error.t()}
  def get_wan_circuits_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.SyntheticDevices, :get_wan_circuits_using_get},
      url: "/api/networks/#{networkId}/wan-circuits",
      method: :get,
      response: [{200, {FwdClient.WanCircuitList, :t}}],
      opts: opts
    })
  end

  @doc """
  Updates an encryptor
  """
  @spec patch_encryptor_using_patch(String.t(), String.t(), FwdClient.EncryptorPatch.t(), keyword) ::
          {:ok, FwdClient.Encryptor.t()} | {:error, FwdClient.Error.t()}
  def patch_encryptor_using_patch(networkId, deviceName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, deviceName: deviceName, body: body],
      call: {FwdClient.SyntheticDevices, :patch_encryptor_using_patch},
      url: "/api/networks/#{networkId}/encryptors/#{deviceName}",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.EncryptorPatch, :t}}],
      response: [{200, {FwdClient.Encryptor, :t}}],
      opts: opts
    })
  end

  @doc """
  Updates an intranet node
  """
  @spec patch_intranet_node_using_patch(
          String.t(),
          String.t(),
          FwdClient.IntranetNodePatch.t(),
          keyword
        ) :: {:ok, FwdClient.IntranetNode.t()} | {:error, FwdClient.Error.t()}
  def patch_intranet_node_using_patch(networkId, nodeName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, nodeName: nodeName, body: body],
      call: {FwdClient.SyntheticDevices, :patch_intranet_node_using_patch},
      url: "/api/networks/#{networkId}/intranet-nodes/#{nodeName}",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.IntranetNodePatch, :t}}],
      response: [{200, {FwdClient.IntranetNode, :t}}],
      opts: opts
    })
  end

  @doc """
  Updates an L2VPN
  """
  @spec patch_l2_vpn_using_patch(String.t(), String.t(), FwdClient.L2VpnPatch.t(), keyword) ::
          {:ok, FwdClient.L2Vpn.t()} | {:error, FwdClient.Error.t()}
  def patch_l2_vpn_using_patch(networkId, l2VpnName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, l2VpnName: l2VpnName, body: body],
      call: {FwdClient.SyntheticDevices, :patch_l2_vpn_using_patch},
      url: "/api/networks/#{networkId}/l2-vpns/#{l2VpnName}",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.L2VpnPatch, :t}}],
      response: [{200, {FwdClient.L2Vpn, :t}}],
      opts: opts
    })
  end

  @doc """
  Updates an L3VPN
  """
  @spec patch_l3_vpn_using_patch(String.t(), String.t(), FwdClient.L3VpnPatch.t(), keyword) ::
          {:ok, FwdClient.L3Vpn.t()} | {:error, FwdClient.Error.t()}
  def patch_l3_vpn_using_patch(networkId, l3VpnName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, l3VpnName: l3VpnName, body: body],
      call: {FwdClient.SyntheticDevices, :patch_l3_vpn_using_patch},
      url: "/api/networks/#{networkId}/l3-vpns/#{l3VpnName}",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.L3VpnPatch, :t}}],
      response: [{200, {FwdClient.L3Vpn, :t}}],
      opts: opts
    })
  end

  @doc """
  Updates a WAN circuit
  """
  @spec patch_wan_circuit_using_patch(
          String.t(),
          String.t(),
          FwdClient.WanCircuitPatch.t(),
          keyword
        ) :: {:ok, FwdClient.WanCircuit.t()} | {:error, FwdClient.Error.t()}
  def patch_wan_circuit_using_patch(networkId, wanCircuitName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, wanCircuitName: wanCircuitName, body: body],
      call: {FwdClient.SyntheticDevices, :patch_wan_circuit_using_patch},
      url: "/api/networks/#{networkId}/wan-circuits/#{wanCircuitName}",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.WanCircuitPatch, :t}}],
      response: [{200, {FwdClient.WanCircuit, :t}}],
      opts: opts
    })
  end

  @doc """
  Adds or replaces an encryptor
  """
  @spec put_encryptor_using_put(String.t(), String.t(), FwdClient.Encryptor.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_encryptor_using_put(networkId, deviceName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, deviceName: deviceName, body: body],
      call: {FwdClient.SyntheticDevices, :put_encryptor_using_put},
      url: "/api/networks/#{networkId}/encryptors/#{deviceName}",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.Encryptor, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Replaces all of a network’s encryptors
  """
  @spec put_encryptors_using_put(String.t(), FwdClient.EncryptorList.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_encryptors_using_put(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.SyntheticDevices, :put_encryptors_using_put},
      url: "/api/networks/#{networkId}/encryptors",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.EncryptorList, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Replaces the network’s internet node
  """
  @spec put_internet_node_using_put(String.t(), FwdClient.InternetNode.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_internet_node_using_put(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.SyntheticDevices, :put_internet_node_using_put},
      url: "/api/networks/#{networkId}/internet-node",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.InternetNode, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Adds or replaces an intranet node
  """
  @spec put_intranet_node_using_put(String.t(), String.t(), FwdClient.IntranetNode.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_intranet_node_using_put(networkId, nodeName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, nodeName: nodeName, body: body],
      call: {FwdClient.SyntheticDevices, :put_intranet_node_using_put},
      url: "/api/networks/#{networkId}/intranet-nodes/#{nodeName}",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.IntranetNode, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Replaces all of a network’s intranet nodes
  """
  @spec put_intranet_nodes_using_put(String.t(), FwdClient.IntranetNodeList.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_intranet_nodes_using_put(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.SyntheticDevices, :put_intranet_nodes_using_put},
      url: "/api/networks/#{networkId}/intranet-nodes",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.IntranetNodeList, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Adds or replaces an L2VPN
  """
  @spec put_l2_vpn_using_put(String.t(), String.t(), FwdClient.L2Vpn.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_l2_vpn_using_put(networkId, l2VpnName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, l2VpnName: l2VpnName, body: body],
      call: {FwdClient.SyntheticDevices, :put_l2_vpn_using_put},
      url: "/api/networks/#{networkId}/l2-vpns/#{l2VpnName}",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.L2Vpn, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Replaces all of a network’s L2VPNs
  """
  @spec put_l2_vpns_using_put(String.t(), FwdClient.L2VpnList.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_l2_vpns_using_put(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.SyntheticDevices, :put_l2_vpns_using_put},
      url: "/api/networks/#{networkId}/l2-vpns",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.L2VpnList, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Adds or replaces an L3VPN
  """
  @spec put_l3_vpn_using_put(String.t(), String.t(), FwdClient.L3Vpn.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_l3_vpn_using_put(networkId, l3VpnName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, l3VpnName: l3VpnName, body: body],
      call: {FwdClient.SyntheticDevices, :put_l3_vpn_using_put},
      url: "/api/networks/#{networkId}/l3-vpns/#{l3VpnName}",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.L3Vpn, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Replaces all of a network’s L3VPNs
  """
  @spec put_l3_vpns_using_put(String.t(), FwdClient.L3VpnList.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_l3_vpns_using_put(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.SyntheticDevices, :put_l3_vpns_using_put},
      url: "/api/networks/#{networkId}/l3-vpns",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.L3VpnList, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Adds or replaces a WAN circuit
  """
  @spec put_wan_circuit_using_put(String.t(), String.t(), FwdClient.WanCircuit.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_wan_circuit_using_put(networkId, wanCircuitName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, wanCircuitName: wanCircuitName, body: body],
      call: {FwdClient.SyntheticDevices, :put_wan_circuit_using_put},
      url: "/api/networks/#{networkId}/wan-circuits/#{wanCircuitName}",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.WanCircuit, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Replaces all of a network’s WAN circuits
  """
  @spec put_wan_circuits_using_put(String.t(), FwdClient.WanCircuitList.t(), keyword) ::
          :ok | {:error, FwdClient.Error.t()}
  def put_wan_circuits_using_put(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.SyntheticDevices, :put_wan_circuits_using_put},
      url: "/api/networks/#{networkId}/wan-circuits",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.WanCircuitList, :t}}],
      response: [{204, :null}],
      opts: opts
    })
  end

  @doc """
  Updates the network’s internet node
  """
  @spec update_internet_node_using_patch(String.t(), FwdClient.InternetNodePatch.t(), keyword) ::
          {:ok, FwdClient.InternetNode.t()} | {:error, FwdClient.Error.t()}
  def update_internet_node_using_patch(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.SyntheticDevices, :update_internet_node_using_patch},
      url: "/api/networks/#{networkId}/internet-node",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.InternetNodePatch, :t}}],
      response: [{200, {FwdClient.InternetNode, :t}}],
      opts: opts
    })
  end
end
