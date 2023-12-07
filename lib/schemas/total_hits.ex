defmodule FwdClient.TotalHits do
  @moduledoc """
  Provides struct and type for a TotalHits
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, type: String.t() | nil, value: integer | nil}

  defstruct [:__info__, :type, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [type: {:enum, ["LOWER_BOUND", "EXACT"]}, value: :integer]
  end
end
