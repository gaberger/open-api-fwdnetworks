defmodule FwdClient.SnapshotExportParams do
  @moduledoc """
  Provides struct and type for a SnapshotExportParams
  """

  @type t :: %__MODULE__{
          excludeDevices: [String.t()] | nil,
          includeDevices: [String.t()] | nil,
          obfuscateNames: boolean | nil,
          obfuscationKey: String.t() | nil
        }

  defstruct [:excludeDevices, :includeDevices, :obfuscateNames, :obfuscationKey]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      excludeDevices: [string: :generic],
      includeDevices: [string: :generic],
      obfuscateNames: :boolean,
      obfuscationKey: {:string, :generic}
    ]
  end
end
