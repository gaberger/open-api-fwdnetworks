defmodule FwdClient.NqeRunResult do
  @moduledoc """
  Provides struct and type for a NqeRunResult
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          items: [FwdClient.NqeRecord.t()] | nil,
          snapshotId: String.t() | nil
        }

  defstruct [:__info__, :items, :snapshotId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: [{FwdClient.NqeRecord, :t}], snapshotId: {:string, :generic}]
  end
end
