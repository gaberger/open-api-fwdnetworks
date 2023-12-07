defmodule FwdClient.L3VpnList do
  @moduledoc """
  Provides struct and type for a L3VpnList
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, l3Vpns: [FwdClient.L3Vpn.t()]}

  defstruct [:__info__, :l3Vpns]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [l3Vpns: [{FwdClient.L3Vpn, :t}]]
  end
end
