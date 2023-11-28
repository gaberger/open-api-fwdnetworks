defmodule FwdClient.DiagnosisReference do
  @moduledoc """
  Provides struct and type for a DiagnosisReference
  """

  @type t :: %__MODULE__{files: map | nil, key: String.t() | nil, value: String.t() | nil}

  defstruct [:files, :key, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [files: :map, key: {:string, :generic}, value: {:string, :generic}]
  end
end
