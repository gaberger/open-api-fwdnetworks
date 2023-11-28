defmodule FwdClient.L2VpnList do
  @moduledoc """
  Provides struct and type for a L2VpnList
  """

  @type t :: %__MODULE__{l2Vpns: [FwdClient.L2Vpn.t()]}

  defstruct [:l2Vpns]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [l2Vpns: [{FwdClient.L2Vpn, :t}]]
  end
end
