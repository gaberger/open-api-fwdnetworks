defmodule FwdClient.PathHop do
  @moduledoc """
  Provides struct and type for a PathHop
  """

  @type t :: %__MODULE__{
          behaviors: [String.t()] | nil,
          deviceName: String.t() | nil,
          deviceType: String.t() | nil,
          displayName: String.t() | nil,
          egressInterface: String.t() | nil,
          ingressInterface: String.t() | nil,
          networkFunctions: FwdClient.NetworkFunctions.t() | nil,
          parseError: boolean | nil
        }

  defstruct [
    :behaviors,
    :deviceName,
    :deviceType,
    :displayName,
    :egressInterface,
    :ingressInterface,
    :networkFunctions,
    :parseError
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      behaviors: [enum: ["L2", "L3", "NAT", "PBR", "ACL_PERMIT", "ACL_DENY"]],
      deviceName: {:string, :generic},
      deviceType:
        {:enum,
         [
           "UNKNOWN",
           "ROUTER",
           "SWITCH",
           "VSWITCH",
           "FIREWALL",
           "LOADBALANCER",
           "BUNDLED_ROUTER",
           "CIRCUIT",
           "L2_VPN_SERVICE",
           "MISSING_PEER",
           "MPLS_VPN_SERVICE",
           "INTERNET_SERVICE",
           "INTRANET_SERVICE",
           "SYNTHETIC_ENCRYPTOR",
           "HYPERVISOR",
           "CONTROLLER",
           "WAN_OPTIMIZER",
           "OPENFLOW_SWITCH",
           "SD_WAN",
           "RIVERBED_INTERCEPTOR",
           "WIFI_AP",
           "ENCRYPTOR",
           "DDI",
           "NIC",
           "AWS_CLOUD",
           "AWS_SUBNET",
           "AWS_RT",
           "AWS_INTERNET_GW",
           "AWS_NAT_GW",
           "AWS_VPN_GW",
           "AWS_LB",
           "AWS_GLOBAL_ACCELERATOR",
           "AWS_DIRECT_CONNECT_GW",
           "AWS_TRANSIT_GW",
           "AWS_NETWORK_FIREWALL",
           "AWS_GATEWAY_LB",
           "AWS_SERVICE_ENDPOINT",
           "EDGE_VM",
           "AZURE_CLOUD",
           "AZURE_SUBNET",
           "AZURE_VNET",
           "AZURE_VNET_GW",
           "AZURE_FIREWALL",
           "AZURE_APP_GW",
           "AZURE_LB",
           "AZURE_VWAN_HUB",
           "AZURE_VPN_GATEWAY",
           "AZURE_P2S_VPN_GATEWAY",
           "AZURE_EXPRESS_ROUTE_GATEWAY",
           "AZURE_VIRTUAL_APPLIANCE",
           "AZURE_EXPRESS_ROUTE_CIRCUIT",
           "GCP_CLOUD",
           "GCP_RT",
           "GCP_SUBNET",
           "GCP_LB",
           "GCP_TRAFFIC_DIRECTOR",
           "GCP_VPN_GW",
           "GCP_NAT_GW",
           "GCP_SERVICE_ATTACHMENT"
         ]},
      displayName: {:string, :generic},
      egressInterface: {:string, :generic},
      ingressInterface: {:string, :generic},
      networkFunctions: {FwdClient.NetworkFunctions, :t},
      parseError: :boolean
    ]
  end
end
