defmodule FwdClient.NqeQuery do
  @moduledoc """
  Provides struct and type for a NqeQuery
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          intent: String.t() | nil,
          path: String.t() | nil,
          queryId: String.t() | nil,
          repository: String.t() | nil
        }

  defstruct [:__info__, :intent, :path, :queryId, :repository]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      intent: {:string, :generic},
      path: {:string, :generic},
      queryId: {:string, :generic},
      repository: {:enum, ["FWD", "ORG"]}
    ]
  end
end
