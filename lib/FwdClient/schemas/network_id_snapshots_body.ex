defmodule FwdClient.NetworkIdSnapshotsBody do
  @moduledoc """
  Provides struct and type for a NetworkIdSnapshotsBody
  """

  @type t :: %__MODULE__{file: [String.t()], note: String.t() | nil}

  defstruct [:file, :note]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [file: [string: :generic], note: {:string, :generic}]
  end
end
