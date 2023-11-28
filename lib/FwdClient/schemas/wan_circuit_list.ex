defmodule FwdClient.WanCircuitList do
  @moduledoc """
  Provides struct and type for a WanCircuitList
  """

  @type t :: %__MODULE__{wanCircuits: [FwdClient.WanCircuit.t()] | nil}

  defstruct [:wanCircuits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [wanCircuits: [{FwdClient.WanCircuit, :t}]]
  end
end
