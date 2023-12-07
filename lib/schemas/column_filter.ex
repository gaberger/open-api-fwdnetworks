defmodule FwdClient.ColumnFilter do
  @moduledoc """
  Provides struct and type for a ColumnFilter
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, columnName: String.t(), value: String.t()}

  defstruct [:__info__, :columnName, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [columnName: {:string, :generic}, value: {:string, :generic}]
  end
end
