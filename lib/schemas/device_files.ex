defmodule FwdClient.DeviceFiles do
  @moduledoc """
  Provides struct and type for a DeviceFiles
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, files: [FwdClient.DeviceFile.t()] | nil}

  defstruct [:__info__, :files]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [files: [{FwdClient.DeviceFile, :t}]]
  end
end
