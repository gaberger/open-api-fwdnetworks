defmodule FwdClient.NqeQueryRunRequest do
  @moduledoc """
  Provides struct and type for a NqeQueryRunRequest
  """

  @type t :: %__MODULE__{
          parameters: map | nil,
          query: String.t() | nil,
          queryId: String.t() | nil,
          queryOptions: FwdClient.NqeQueryOptions.t() | nil
        }

  defstruct [:parameters, :query, :queryId, :queryOptions]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      parameters: :map,
      query: {:string, :generic},
      queryId: {:string, :generic},
      queryOptions: {FwdClient.NqeQueryOptions, :t}
    ]
  end
end
