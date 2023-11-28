defmodule FwdClient.DeviceFiles do
  @moduledoc """
  Provides struct and type for a DeviceFiles
  """

  @type t :: %__MODULE__{files: [FwdClient.DeviceFile.t()] | nil}

  defstruct [:files]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [files: [{FwdClient.DeviceFile, :t}]]
  end
end
