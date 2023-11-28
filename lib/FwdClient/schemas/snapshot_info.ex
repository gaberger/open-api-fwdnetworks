defmodule FwdClient.SnapshotInfo do
  @moduledoc """
  Provides struct and type for a SnapshotInfo
  """

  @type t :: %__MODULE__{
          creationDateMillis: integer | nil,
          favoritedAtMillis: integer | nil,
          favoritedBy: String.t() | nil,
          favoritedByUserId: String.t() | nil,
          id: String.t() | nil,
          isDraft: boolean | nil,
          note: String.t() | nil,
          parentSnapshotId: String.t() | nil,
          processedAtMillis: integer | nil,
          processingTrigger: String.t() | nil,
          state: String.t() | nil
        }

  defstruct [
    :creationDateMillis,
    :favoritedAtMillis,
    :favoritedBy,
    :favoritedByUserId,
    :id,
    :isDraft,
    :note,
    :parentSnapshotId,
    :processedAtMillis,
    :processingTrigger,
    :state
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      creationDateMillis: :integer,
      favoritedAtMillis: :integer,
      favoritedBy: {:string, :generic},
      favoritedByUserId: {:string, :generic},
      id: {:string, :generic},
      isDraft: :boolean,
      note: {:string, :generic},
      parentSnapshotId: {:string, :generic},
      processedAtMillis: :integer,
      processingTrigger: {:enum, ["UNKNOWN", "COLLECTION", "IMPORT", "REPROCESS", "FORK"]},
      state:
        {:enum,
         [
           "UNPACKING",
           "UNPROCESSED",
           "PROCESSING",
           "PROCESSED",
           "FAILED",
           "CANCELED",
           "TIMED_OUT"
         ]}
    ]
  end
end
