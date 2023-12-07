defmodule FwdClient.TextPosition do
  @moduledoc """
  Provides struct and type for a TextPosition
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, character: integer | nil, line: integer | nil}

  defstruct [:__info__, :character, :line]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [character: :integer, line: :integer]
  end
end
