defmodule FwdClient.PathSearchBulkRequest do
  @moduledoc """
  Provides struct and type for a PathSearchBulkRequest
  """

  @type t :: %__MODULE__{
          includeNetworkFunctions: boolean | nil,
          intent: String.t() | nil,
          maxCandidates: integer | nil,
          maxOverallSeconds: integer | nil,
          maxResults: integer | nil,
          maxReturnPathResults: integer | nil,
          maxSeconds: integer | nil,
          queries: [FwdClient.PathSearchQuery.t()]
        }

  defstruct [
    :includeNetworkFunctions,
    :intent,
    :maxCandidates,
    :maxOverallSeconds,
    :maxResults,
    :maxReturnPathResults,
    :maxSeconds,
    :queries
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      includeNetworkFunctions: :boolean,
      intent: {:enum, ["PREFER_VIOLATIONS", "PREFER_DELIVERED", "VIOLATIONS_ONLY"]},
      maxCandidates: :integer,
      maxOverallSeconds: :integer,
      maxResults: :integer,
      maxReturnPathResults: :integer,
      maxSeconds: :integer,
      queries: [{FwdClient.PathSearchQuery, :t}]
    ]
  end
end
