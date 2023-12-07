defmodule FwdClient.WanCircuitList do
  @moduledoc """
  Provides struct and type for a WanCircuitList
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, wanCircuits: [FwdClient.WanCircuit.t()] | nil}

  defstruct [:__info__, :wanCircuits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wanCircuits: [{FwdClient.WanCircuit, :t}]]
  end
end
