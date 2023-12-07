defmodule FwdClient.NetworkSetup do
  @moduledoc """
  Provides API endpoints related to network setup
  """

  @default_client FwdClient.Client

  @doc """
  Creates or updates network device sources
  """
  @spec add_or_update_device_sources_using_post(String.t(), FwdClient.DeviceSource.t(), keyword) ::
          {:ok, FwdClient.EmptyObject.t()} | {:error, FwdClient.Error.t()}
  def add_or_update_device_sources_using_post(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkSetup, :add_or_update_device_sources_using_post},
      url: "/api/networks/#{networkId}/deviceSources",
      body: body,
      method: :post,
      request: [{"application/json", [{FwdClient.DeviceSource, :t}]}],
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates or replaces a network device credential

  If `id` is specified and a device credential with that id exists, it is replaced. Otherwise, a new device credential is created.
  """
  @spec create_device_credential_using_post(String.t(), FwdClient.DeviceCredential.t(), keyword) ::
          {:ok, FwdClient.DeviceCredential.t()} | {:error, FwdClient.Error.t()}
  def create_device_credential_using_post(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkSetup, :create_device_credential_using_post},
      url: "/api/networks/#{networkId}/deviceCredentials",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.DeviceCredential, :t}}],
      response: [{200, {FwdClient.DeviceCredential, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates or replaces network device credentials

  Any device credentials that specify an `id` will replace the device credential with that id if such a credential exists.
  """
  @spec create_device_credentials_using_patch(String.t(), FwdClient.DeviceCredential.t(), keyword) ::
          {:ok, [FwdClient.DeviceCredential.t()]} | {:error, FwdClient.Error.t()}
  def create_device_credentials_using_patch(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkSetup, :create_device_credentials_using_patch},
      url: "/api/networks/#{networkId}/deviceCredentials",
      body: body,
      method: :patch,
      request: [{"application/json", [{FwdClient.DeviceCredential, :t}]}],
      response: [{200, [{FwdClient.DeviceCredential, :t}]}],
      opts: opts
    })
  end

  @doc """
  Creates or replaces a jump server
  """
  @spec create_jump_server_using_post(String.t(), FwdClient.JumpServer.t(), keyword) ::
          {:ok, FwdClient.JumpServer.t()} | {:error, FwdClient.Error.t()}
  def create_jump_server_using_post(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkSetup, :create_jump_server_using_post},
      url: "/api/networks/#{networkId}/jumpServers",
      body: body,
      method: :post,
      request: [{"application/json", {FwdClient.JumpServer, :t}}],
      response: [{200, {FwdClient.JumpServer, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes a network device credential
  """
  @spec delete_device_credential_using_delete(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.EmptyObject.t()} | {:error, FwdClient.Error.t()}
  def delete_device_credential_using_delete(networkId, credentialId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, credentialId: credentialId],
      call: {FwdClient.NetworkSetup, :delete_device_credential_using_delete},
      url: "/api/networks/#{networkId}/deviceCredentials/#{credentialId}",
      method: :delete,
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes a network device source
  """
  @spec delete_device_source_using_delete(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.EmptyObject.t()} | {:error, FwdClient.Error.t()}
  def delete_device_source_using_delete(networkId, deviceSourceName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, deviceSourceName: deviceSourceName],
      call: {FwdClient.NetworkSetup, :delete_device_source_using_delete},
      url: "/api/networks/#{networkId}/deviceSources/#{deviceSourceName}",
      method: :delete,
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes network device sources
  """
  @spec delete_device_sources_using_delete(
          String.t(),
          FwdClient.DeviceSourceCriteria.t(),
          keyword
        ) :: {:ok, FwdClient.DeleteDeviceSourcesResult.t()} | {:error, FwdClient.Error.t()}
  def delete_device_sources_using_delete(networkId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, body: body],
      call: {FwdClient.NetworkSetup, :delete_device_sources_using_delete},
      url: "/api/networks/#{networkId}/deviceSources",
      body: body,
      method: :delete,
      request: [{"*/*", {FwdClient.DeviceSourceCriteria, :t}}],
      response: [{200, {FwdClient.DeleteDeviceSourcesResult, :t}}],
      opts: opts
    })
  end

  @doc """
  Deletes a jump server
  """
  @spec delete_jump_server_using_delete(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.EmptyObject.t()} | {:error, FwdClient.Error.t()}
  def delete_jump_server_using_delete(networkId, jumpServerId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, jumpServerId: jumpServerId],
      call: {FwdClient.NetworkSetup, :delete_jump_server_using_delete},
      url: "/api/networks/#{networkId}/jumpServers/#{jumpServerId}",
      method: :delete,
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Updates a jump server
  """
  @spec edit_jump_server_using_patch(
          String.t(),
          String.t(),
          FwdClient.JumpServerUpdate.t(),
          keyword
        ) :: {:ok, FwdClient.EmptyObject.t()} | {:error, FwdClient.Error.t()}
  def edit_jump_server_using_patch(networkId, jumpServerId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, jumpServerId: jumpServerId, body: body],
      call: {FwdClient.NetworkSetup, :edit_jump_server_using_patch},
      url: "/api/networks/#{networkId}/jumpServers/#{jumpServerId}",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.JumpServerUpdate, :t}}],
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Lists a network’s device credentials

  Omits the sensitive properties `password` and `content`.
  """
  @spec get_device_credentials_using_get(String.t(), keyword) ::
          {:ok, [FwdClient.DeviceCredential.t()]} | {:error, FwdClient.Error.t()}
  def get_device_credentials_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkSetup, :get_device_credentials_using_get},
      url: "/api/networks/#{networkId}/deviceCredentials",
      method: :get,
      response: [{200, [{FwdClient.DeviceCredential, :t}]}],
      opts: opts
    })
  end

  @doc """
  Gets a network device source
  """
  @spec get_device_source_using_get(String.t(), String.t(), keyword) ::
          {:ok, FwdClient.DeviceSource.t()} | {:error, FwdClient.Error.t()}
  def get_device_source_using_get(networkId, deviceSourceName, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, deviceSourceName: deviceSourceName],
      call: {FwdClient.NetworkSetup, :get_device_source_using_get},
      url: "/api/networks/#{networkId}/deviceSources/#{deviceSourceName}",
      method: :get,
      response: [{200, {FwdClient.DeviceSource, :t}}],
      opts: opts
    })
  end

  @doc """
  Gets a network’s device sources
  """
  @spec get_device_sources_using_get(String.t(), keyword) ::
          {:ok, [FwdClient.DeviceSource.t()]} | {:error, FwdClient.Error.t()}
  def get_device_sources_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkSetup, :get_device_sources_using_get},
      url: "/api/networks/#{networkId}/deviceSources",
      method: :get,
      response: [{200, [{FwdClient.DeviceSource, :t}]}],
      opts: opts
    })
  end

  @doc """
  Lists a network’s jump servers

  Omits the sensitive `password` property.
  """
  @spec get_jump_servers_using_get(String.t(), keyword) ::
          {:ok, [FwdClient.JumpServer.t()]} | {:error, FwdClient.Error.t()}
  def get_jump_servers_using_get(networkId, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId],
      call: {FwdClient.NetworkSetup, :get_jump_servers_using_get},
      url: "/api/networks/#{networkId}/jumpServers",
      method: :get,
      response: [{200, [{FwdClient.JumpServer, :t}]}],
      opts: opts
    })
  end

  @doc """
  Updates a network device credential
  """
  @spec patch_device_credential_using_patch(
          String.t(),
          String.t(),
          FwdClient.DeviceCredentialUpdate.t(),
          keyword
        ) :: {:ok, FwdClient.EmptyObject.t()} | {:error, FwdClient.Error.t()}
  def patch_device_credential_using_patch(networkId, credentialId, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, credentialId: credentialId, body: body],
      call: {FwdClient.NetworkSetup, :patch_device_credential_using_patch},
      url: "/api/networks/#{networkId}/deviceCredentials/#{credentialId}",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.DeviceCredentialUpdate, :t}}],
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end

  @doc """
  Updates a network device source
  """
  @spec patch_device_source_using_patch(
          String.t(),
          String.t(),
          FwdClient.DeviceSourcePatch.t(),
          keyword
        ) :: {:ok, FwdClient.DeviceSource.t()} | {:error, FwdClient.Error.t()}
  def patch_device_source_using_patch(networkId, deviceSourceName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, deviceSourceName: deviceSourceName, body: body],
      call: {FwdClient.NetworkSetup, :patch_device_source_using_patch},
      url: "/api/networks/#{networkId}/deviceSources/#{deviceSourceName}",
      body: body,
      method: :patch,
      request: [{"application/json", {FwdClient.DeviceSourcePatch, :t}}],
      response: [{200, {FwdClient.DeviceSource, :t}}],
      opts: opts
    })
  end

  @doc """
  Creates or replaces a network device source
  """
  @spec update_device_source_using_put(
          String.t(),
          String.t(),
          FwdClient.DeviceSource.t(),
          keyword
        ) :: {:ok, FwdClient.EmptyObject.t()} | {:error, FwdClient.Error.t()}
  def update_device_source_using_put(networkId, deviceSourceName, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [networkId: networkId, deviceSourceName: deviceSourceName, body: body],
      call: {FwdClient.NetworkSetup, :update_device_source_using_put},
      url: "/api/networks/#{networkId}/deviceSources/#{deviceSourceName}",
      body: body,
      method: :put,
      request: [{"application/json", {FwdClient.DeviceSource, :t}}],
      response: [{200, {FwdClient.EmptyObject, :t}}],
      opts: opts
    })
  end
end
