defmodule FwdClient.InterfaceFunctionL2Info do
  @moduledoc """
  Provides struct and type for a InterfaceFunctionL2Info
  """

  @type t :: %__MODULE__{interfaceName: String.t() | nil}

  defstruct [:interfaceName]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [interfaceName: {:string, :generic}]
  end
end
