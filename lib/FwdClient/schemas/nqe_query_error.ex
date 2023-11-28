defmodule FwdClient.NqeQueryError do
  @moduledoc """
  Provides struct and type for a NqeQueryError
  """

  @type t :: %__MODULE__{location: FwdClient.TextRegion.t() | nil, message: String.t() | nil}

  defstruct [:location, :message]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [location: {FwdClient.TextRegion, :t}, message: {:string, :generic}]
  end
end
