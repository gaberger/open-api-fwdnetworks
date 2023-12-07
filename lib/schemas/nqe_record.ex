defmodule FwdClient.NqeRecord do
  @moduledoc """
  Provides struct and type for a NqeRecord
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, fields: map | nil}

  defstruct [:__info__, :fields]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [fields: :map]
  end
end
