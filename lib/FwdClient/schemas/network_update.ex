defmodule FwdClient.NetworkUpdate do
  @moduledoc """
  Provides struct and type for a NetworkUpdate
  """

  @type t :: %__MODULE__{name: String.t() | nil, note: String.t() | nil}

  defstruct [:name, :note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [name: {:string, :generic}, note: {:string, :generic}]
  end
end
