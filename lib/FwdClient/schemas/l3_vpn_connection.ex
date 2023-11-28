defmodule FwdClient.L3VpnConnection do
  @moduledoc """
  Provides struct and type for a L3VpnConnection
  """

  @type t :: %__MODULE__{
          advertisesDefaultRoute: boolean | nil,
          backdoorLinkPorts: [FwdClient.DevicePort.t()] | nil,
          gatewayPort: FwdClient.DevicePort.t() | nil,
          name: String.t() | nil,
          peerIps: [String.t()] | nil,
          subnetAutoDiscovery: String.t() | nil,
          subnets: [String.t()] | nil,
          uplinkPort: FwdClient.DevicePort.t(),
          vlan: integer | nil,
          vrf: String.t() | nil
        }

  defstruct [
    :advertisesDefaultRoute,
    :backdoorLinkPorts,
    :gatewayPort,
    :name,
    :peerIps,
    :subnetAutoDiscovery,
    :subnets,
    :uplinkPort,
    :vlan,
    :vrf
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
      subnetAutoDiscovery: {:enum, ["NONE", "IP_ROUTES", "BGP_ROUTES", "INTERFACE_ADDRESSES"]},
      subnets: [string: :generic],
      uplinkPort: {FwdClient.DevicePort, :t},
      vlan: :integer,
      vrf: {:string, :generic}
    ]
  end
end
