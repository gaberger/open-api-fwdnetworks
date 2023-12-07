defmodule FwdClient.Link do
  @moduledoc """
  Provides struct and type for a Link
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, port1: String.t() | nil, port2: String.t() | nil}

  defstruct [:__info__, :port1, :port2]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [port1: {:string, :generic}, port2: {:string, :generic}]
  end
end
