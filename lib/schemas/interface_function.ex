defmodule FwdClient.InterfaceFunction do
  @moduledoc """
  Provides struct and type for a InterfaceFunction
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          l2: FwdClient.InterfaceFunctionL2Info.t() | nil,
          l3: FwdClient.InterfaceFunctionL3Info.t() | nil
        }

  defstruct [:__info__, :l2, :l3]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [l2: {FwdClient.InterfaceFunctionL2Info, :t}, l3: {FwdClient.InterfaceFunctionL3Info, :t}]
  end
end
