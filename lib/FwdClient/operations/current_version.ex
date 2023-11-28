defmodule FwdClient.CurrentVersion do
  @moduledoc """
  Provides API endpoint related to current version
  """

  @default_client FwdClient.Client

  @doc """
  Gets the API’s current version
  """
  @spec get_api_version_using_get(keyword) :: {:ok, FwdClient.ApiVersion.t()} | :error
  def get_api_version_using_get(opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [],
      call: {FwdClient.CurrentVersion, :get_api_version_using_get},
      url: "/api/version",
      method: :get,
      response: [{200, {FwdClient.ApiVersion, :t}}],
      opts: opts
    })
  end
end
