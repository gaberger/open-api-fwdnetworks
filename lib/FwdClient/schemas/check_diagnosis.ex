defmodule FwdClient.CheckDiagnosis do
  @moduledoc """
  Provides struct and type for a CheckDiagnosis
  """

  @type t :: %__MODULE__{
          details: [FwdClient.DiagnosisDetail.t()] | nil,
          detailsIncomplete: boolean | nil,
          summary: String.t() | nil
        }

  defstruct [:details, :detailsIncomplete, :summary]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      details: [{FwdClient.DiagnosisDetail, :t}],
      detailsIncomplete: :boolean,
      summary: {:string, :generic}
    ]
  end
end
