defmodule FwdClient.DiagnosisDetail do
  @moduledoc """
  Provides struct and type for a DiagnosisDetail
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          query: String.t() | nil,
          references: [FwdClient.DiagnosisReference.t()] | nil
        }

  defstruct [:__info__, :query, :references]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [query: {:string, :generic}, references: [{FwdClient.DiagnosisReference, :t}]]
  end
end
