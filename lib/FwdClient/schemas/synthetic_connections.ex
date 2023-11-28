defmodule FwdClient.SyntheticConnections do
  @moduledoc """
  Provides struct and type for a SyntheticConnections
  """

  @type t :: %__MODULE__{connections: [FwdClient.SyntheticConnection.t()] | nil}

  defstruct [:connections]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [connections: [{FwdClient.SyntheticConnection, :t}]]
  end
end
