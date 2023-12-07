defmodule FwdClient.SyntheticConnections do
  @moduledoc """
  Provides struct and type for a SyntheticConnections
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, connections: [FwdClient.SyntheticConnection.t()] | nil}

  defstruct [:__info__, :connections]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [connections: [{FwdClient.SyntheticConnection, :t}]]
  end
end
