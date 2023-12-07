defmodule FwdClient.InetConnection do
  @moduledoc """
  Provides struct and type for a InetConnection
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          advertisesDefaultRoute: boolean | nil,
          backdoorLinkPorts: [FwdClient.DevicePort.t()] | nil,
          gatewayPort: FwdClient.DevicePort.t() | nil,
          name: String.t() | nil,
          peerIps: [String.t()] | nil,
          site: String.t() | nil,
          subnetAutoDiscovery: String.t() | nil,
          subnets: [String.t()] | nil,
          uplinkPort: FwdClient.DevicePort.t(),
          vlan: integer | nil
        }

  defstruct [
    :__info__,
    :advertisesDefaultRoute,
    :backdoorLinkPorts,
    :gatewayPort,
    :name,
    :peerIps,
    :site,
    :subnetAutoDiscovery,
    :subnets,
    :uplinkPort,
    :vlan
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      advertisesDefaultRoute: :boolean,
      backdoorLinkPorts: [{FwdClient.DevicePort, :t}],
      gatewayPort: {FwdClient.DevicePort, :t},
      name: {:string, :generic},
      peerIps: [string: :generic],
      site: {:string, :generic},
      subnetAutoDiscovery: {:enum, ["NONE", "IP_ROUTES", "BGP_ROUTES", "INTERFACE_ADDRESSES"]},
      subnets: [string: :generic],
      uplinkPort: {FwdClient.DevicePort, :t},
      vlan: :integer
    ]
  end
end
