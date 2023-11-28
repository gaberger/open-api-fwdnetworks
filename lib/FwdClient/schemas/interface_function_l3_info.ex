defmodule FwdClient.InterfaceFunctionL3Info do
  @moduledoc """
  Provides struct and type for a InterfaceFunctionL3Info
  """

  @type t :: %__MODULE__{interfaceName: String.t() | nil, vrf: String.t() | nil}

  defstruct [:interfaceName, :vrf]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [interfaceName: {:string, :generic}, vrf: {:string, :generic}]
  end
end
