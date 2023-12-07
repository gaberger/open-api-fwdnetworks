defmodule FwdClient.AvailablePredefinedCheck do
  @moduledoc """
  Provides struct and type for a AvailablePredefinedCheck
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          description: String.t() | nil,
          name: String.t() | nil,
          predefinedCheckType: String.t() | nil
        }

  defstruct [:__info__, :description, :name, :predefinedCheckType]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      name: {:string, :generic},
      predefinedCheckType:
        {:enum,
         [
           "BGP_NEIGHBOR_ADJACENCY",
           "BGP_ROUTER_ID",
           "BGP_ROUTE_CONSISTENCY",
           "BGP_VPC_PARAMETER_CONSISTENCY",
           "EBGP_SELECTION_OVER_IBGP",
           "BGP_COMMUNITY_LIST",
           "NEXT_HOP_REACHABILITY",
           "NO_LOOP",
           "SHORTEST_PATH",
           "IP_UNIQUENESS",
           "HOSTNAME_CONSISTENCY",
           "HOSTNAME_UNIQUENESS",
           "VLAN_CONSISTENCY",
           "MTU_CONSISTENCY",
           "PORT_CHANNEL_CONSISTENCY",
           "DUPLEX_CONSISTENCY",
           "LINK_SPEED_CONSISTENCY",
           "SOFTWARE_VERSION_CONSISTENCY",
           "TRUNK_INTERFACE_WHITELIST",
           "VLAN_EXISTENCE",
           "LEARNED_MAC_CONSISTENCY",
           "FHRP_PEERING",
           "VPC_PARAMETER_CONSISTENCY",
           "VPC_INTERFACE_PARAMETER_CONSISTENCY",
           "VPC_DEDICATED_KEEPALIVE_LINK",
           "VPC_ROLE_PRIORITY",
           "SSH_RSA_KEY_LENGTH",
           "VPC_STP_PRIORITY",
           "VPC_MST_REGION_CONSISTENCY"
         ]}
    ]
  end
end
