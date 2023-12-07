defmodule FwdClient.NetworkIdSnapshotsBody do
  @moduledoc """
  Provides struct and type for a NetworkIdSnapshotsBody
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, file: [String.t()], note: String.t() | nil}

  defstruct [:__info__, :file, :note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file: [string: :generic], note: {:string, :generic}]
  end
end
