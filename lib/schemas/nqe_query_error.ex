defmodule FwdClient.NqeQueryError do
  @moduledoc """
  Provides struct and type for a NqeQueryError
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          location: FwdClient.TextRegion.t() | nil,
          message: String.t() | nil
        }

  defstruct [:__info__, :location, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [location: {FwdClient.TextRegion, :t}, message: {:string, :generic}]
  end
end
