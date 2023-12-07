defmodule FwdClient.NetworkCheckResultWithDiagnosis do
  @moduledoc """
  Provides struct and type for a NetworkCheckResultWithDiagnosis
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          creationDateMillis: integer | nil,
          creator: String.t() | nil,
          creatorId: String.t() | nil,
          definition: FwdClient.CheckDefinition.t() | nil,
          definitionDateMillis: integer | nil,
          description: String.t() | nil,
          diagnosis: FwdClient.CheckDiagnosis.t() | nil,
          editDateMillis: integer | nil,
          editor: String.t() | nil,
          editorId: String.t() | nil,
          enabled: boolean | nil,
          executionDateMillis: integer | nil,
          executionDurationMillis: integer | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          note: String.t() | nil,
          numViolations: integer | nil,
          priority: String.t() | nil,
          status: String.t() | nil,
          tags: [String.t()] | nil
        }

  defstruct [
    :__info__,
    :creationDateMillis,
    :creator,
    :creatorId,
    :definition,
    :definitionDateMillis,
    :description,
    :diagnosis,
    :editDateMillis,
    :editor,
    :editorId,
    :enabled,
    :executionDateMillis,
    :executionDurationMillis,
    :id,
    :name,
    :note,
    :numViolations,
    :priority,
    :status,
    :tags
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      creationDateMillis: :integer,
      creator: {:string, :generic},
      creatorId: {:string, :generic},
      definition: {FwdClient.CheckDefinition, :t},
      definitionDateMillis: :integer,
      description: {:string, :generic},
      diagnosis: {FwdClient.CheckDiagnosis, :t},
      editDateMillis: :integer,
      editor: {:string, :generic},
      editorId: {:string, :generic},
      enabled: :boolean,
      executionDateMillis: :integer,
      executionDurationMillis: :integer,
      id: {:string, :generic},
      name: {:string, :generic},
      note: {:string, :generic},
      numViolations: :integer,
      priority: {:enum, ["NOT_SET", "LOW", "MEDIUM", "HIGH"]},
      status: {:enum, ["NONE", "PASS", "FAIL", "ERROR", "TIMEOUT", "PROCESSING"]},
      tags: [string: :generic]
    ]
  end
end
