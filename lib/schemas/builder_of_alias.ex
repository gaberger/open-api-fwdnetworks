defmodule FwdClient.BuilderOfAlias do
  @moduledoc """
  Provides struct and type for a BuilderOfAlias
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, name: String.t(), type: String.t()}

  defstruct [:__info__, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      name: {:string, :generic},
      type: {:enum, ["HOSTS", "DEVICES", "INTERFACES", "HEADERS", "LOGICAL_NETWORK"]}
    ]
  end
end
