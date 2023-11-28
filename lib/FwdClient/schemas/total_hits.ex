defmodule FwdClient.TotalHits do
  @moduledoc """
  Provides struct and type for a TotalHits
  """

  @type t :: %__MODULE__{type: String.t() | nil, value: integer | nil}

  defstruct [:type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:enum, ["LOWER_BOUND", "EXACT"]}, value: :integer]
  end
end
