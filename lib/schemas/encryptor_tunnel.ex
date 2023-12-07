defmodule FwdClient.EncryptorTunnel do
  @moduledoc """
  Provides struct and type for a EncryptorTunnel
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, destination: String.t(), source: String.t()}

  defstruct [:__info__, :destination, :source]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [destination: {:string, :generic}, source: {:string, :generic}]
  end
end
