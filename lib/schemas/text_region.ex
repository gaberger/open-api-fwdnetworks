defmodule FwdClient.TextRegion do
  @moduledoc """
  Provides struct and type for a TextRegion
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          end: FwdClient.TextPosition.t() | nil,
          start: FwdClient.TextPosition.t() | nil
        }

  defstruct [:__info__, :end, :start]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [end: {FwdClient.TextPosition, :t}, start: {FwdClient.TextPosition, :t}]
  end
end
