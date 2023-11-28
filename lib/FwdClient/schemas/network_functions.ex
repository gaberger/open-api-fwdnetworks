defmodule FwdClient.NetworkFunctions do
  @moduledoc """
  Provides struct and type for a NetworkFunctions
  """

  @type t :: %__MODULE__{
          acl: [FwdClient.AclFunction.t()] | nil,
          egress: FwdClient.InterfaceFunction.t() | nil,
          ingress: FwdClient.InterfaceFunction.t() | nil
        }

  defstruct [:acl, :egress, :ingress]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      acl: [{FwdClient.AclFunction, :t}],
      egress: {FwdClient.InterfaceFunction, :t},
      ingress: {FwdClient.InterfaceFunction, :t}
    ]
  end
end
