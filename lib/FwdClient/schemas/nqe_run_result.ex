defmodule FwdClient.NqeRunResult do
  @moduledoc """
  Provides struct and type for a NqeRunResult
  """

  @type t :: %__MODULE__{items: [FwdClient.NqeRecord.t()] | nil, snapshotId: String.t() | nil}

  defstruct [:items, :snapshotId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [items: [{FwdClient.NqeRecord, :t}], snapshotId: {:string, :generic}]
  end
end
