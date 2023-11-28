defmodule FwdClient.WanCircuitPatch do
  @moduledoc """
  Provides struct and type for a WanCircuitPatch
  """

  @type t :: %__MODULE__{
          connection1: FwdClient.WanCircuitConnection.t() | nil,
          connection2: FwdClient.WanCircuitConnection.t() | nil,
          name: String.t() | nil
        }

  defstruct [:connection1, :connection2, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      connection1: {FwdClient.WanCircuitConnection, :t},
      connection2: {FwdClient.WanCircuitConnection, :t},
      name: {:string, :generic}
    ]
  end
end
