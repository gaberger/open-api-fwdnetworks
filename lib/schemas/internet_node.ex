defmodule FwdClient.InternetNode do
  @moduledoc """
  Provides struct and type for a InternetNode
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          connections: [FwdClient.InetConnection.t()],
          name: String.t()
        }

  defstruct [:__info__, :connections, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [connections: [{FwdClient.InetConnection, :t}], name: {:string, :generic}]
  end
end
