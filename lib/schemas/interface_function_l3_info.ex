defmodule FwdClient.InterfaceFunctionL3Info do
  @moduledoc """
  Provides struct and type for a InterfaceFunctionL3Info
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, interfaceName: String.t() | nil, vrf: String.t() | nil}

  defstruct [:__info__, :interfaceName, :vrf]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [interfaceName: {:string, :generic}, vrf: {:string, :generic}]
  end
end
