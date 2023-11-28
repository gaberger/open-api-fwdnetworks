defmodule FwdClient.SnapshotMetrics do
  @moduledoc """
  Provides struct and type for a SnapshotMetrics
  """

  @type t :: %__MODULE__{
          collectionConcurrency: integer | nil,
          collectionDuration: integer | nil,
          collectionFailures: map | nil,
          creationDateMillis: integer | nil,
          hostComputationStatus: String.t() | nil,
          ipLocationIndexingStatus: String.t() | nil,
          jumpServerCollectionConcurrency: integer | nil,
          l2IndexingStatus: String.t() | nil,
          needsReprocessing: boolean | nil,
          numCollectionFailureDevices: integer | nil,
          numParsingFailureDevices: integer | nil,
          numSuccessfulDevices: integer | nil,
          parsingFailures: map | nil,
          pathSearchIndexingStatus: String.t() | nil,
          processingDuration: integer | nil,
          searchIndexingStatus: String.t() | nil,
          snapshotId: String.t() | nil
        }

  defstruct [
    :collectionConcurrency,
    :collectionDuration,
    :collectionFailures,
    :creationDateMillis,
    :hostComputationStatus,
    :ipLocationIndexingStatus,
    :jumpServerCollectionConcurrency,
    :l2IndexingStatus,
    :needsReprocessing,
    :numCollectionFailureDevices,
    :numParsingFailureDevices,
    :numSuccessfulDevices,
    :parsingFailures,
    :pathSearchIndexingStatus,
    :processingDuration,
    :searchIndexingStatus,
    :snapshotId
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      collectionConcurrency: :integer,
      collectionDuration: :integer,
      collectionFailures: :map,
      creationDateMillis: :integer,
      hostComputationStatus: {:enum, ["UNKNOWN", "FAILURE", "SUCCESS", "CANCELED"]},
      ipLocationIndexingStatus: {:enum, ["UNKNOWN", "FAILURE", "SUCCESS", "CANCELED"]},
      jumpServerCollectionConcurrency: :integer,
      l2IndexingStatus: {:enum, ["UNKNOWN", "FAILURE", "SUCCESS", "CANCELED"]},
      needsReprocessing: :boolean,
      numCollectionFailureDevices: :integer,
      numParsingFailureDevices: :integer,
      numSuccessfulDevices: :integer,
      parsingFailures: :map,
      pathSearchIndexingStatus: {:enum, ["UNKNOWN", "FAILURE", "SUCCESS", "CANCELED"]},
      processingDuration: :integer,
      searchIndexingStatus: {:enum, ["UNKNOWN", "FAILURE", "SUCCESS", "CANCELED"]},
      snapshotId: {:string, :generic}
    ]
  end
end
