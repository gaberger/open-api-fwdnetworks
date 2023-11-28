defmodule FwdClient.TextPosition do
  @moduledoc """
  Provides struct and type for a TextPosition
  """

  @type t :: %__MODULE__{character: integer | nil, line: integer | nil}

  defstruct [:character, :line]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [character: :integer, line: :integer]
  end
end
