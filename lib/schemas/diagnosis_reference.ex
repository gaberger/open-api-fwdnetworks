defmodule FwdClient.DiagnosisReference do
  @moduledoc """
  Provides struct and type for a DiagnosisReference
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          files: map | nil,
          key: String.t() | nil,
          value: String.t() | nil
        }

  defstruct [:__info__, :files, :key, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [files: :map, key: {:string, :generic}, value: {:string, :generic}]
  end
end
