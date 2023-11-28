defmodule FwdClient.InternetNode do
  @moduledoc """
  Provides struct and type for a InternetNode
  """

  @type t :: %__MODULE__{connections: [FwdClient.InetConnection.t()], name: String.t()}

  defstruct [:connections, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [connections: [{FwdClient.InetConnection, :t}], name: {:string, :generic}]
  end
end
