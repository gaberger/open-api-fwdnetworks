defmodule FwdClient.L3VpnList do
  @moduledoc """
  Provides struct and type for a L3VpnList
  """

  @type t :: %__MODULE__{l3Vpns: [FwdClient.L3Vpn.t()]}

  defstruct [:l3Vpns]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [l3Vpns: [{FwdClient.L3Vpn, :t}]]
  end
end
