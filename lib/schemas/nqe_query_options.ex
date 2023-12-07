defmodule FwdClient.NqeQueryOptions do
  @moduledoc """
  Provides struct and type for a NqeQueryOptions
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          columnFilters: [FwdClient.ColumnFilter.t()] | nil,
          limit: integer | nil,
          offset: integer | nil,
          sortBy: FwdClient.SortOrder.t() | nil
        }

  defstruct [:__info__, :columnFilters, :limit, :offset, :sortBy]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      columnFilters: [{FwdClient.ColumnFilter, :t}],
      limit: :integer,
      offset: :integer,
      sortBy: {FwdClient.SortOrder, :t}
    ]
  end
end
