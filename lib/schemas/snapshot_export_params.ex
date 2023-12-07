defmodule FwdClient.SnapshotExportParams do
  @moduledoc """
  Provides struct and type for a SnapshotExportParams
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          excludeDevices: [String.t()] | nil,
          includeDevices: [String.t()] | nil,
          obfuscateNames: boolean | nil,
          obfuscationKey: String.t() | nil
        }

  defstruct [:__info__, :excludeDevices, :includeDevices, :obfuscateNames, :obfuscationKey]

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
