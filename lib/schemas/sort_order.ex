defmodule FwdClient.SortOrder do
  @moduledoc """
  Provides struct and type for a SortOrder
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, columnName: String.t(), order: String.t() | nil}

  defstruct [:__info__, :columnName, :order]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [columnName: {:string, :generic}, order: {:enum, ["ASC", "DESC"]}]
  end
end
