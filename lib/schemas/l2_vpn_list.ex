defmodule FwdClient.L2VpnList do
  @moduledoc """
  Provides struct and type for a L2VpnList
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, l2Vpns: [FwdClient.L2Vpn.t()]}

  defstruct [:__info__, :l2Vpns]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [l2Vpns: [{FwdClient.L2Vpn, :t}]]
  end
end
