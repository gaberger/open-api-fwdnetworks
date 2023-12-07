defmodule FwdClient.PathInfo do
  @moduledoc """
  Provides struct and type for a PathInfo
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          paths: [FwdClient.Path.t()] | nil,
          totalHits: FwdClient.TotalHits.t() | nil
        }

  defstruct [:__info__, :paths, :totalHits]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [paths: [{FwdClient.Path, :t}], totalHits: {FwdClient.TotalHits, :t}]
  end
end
