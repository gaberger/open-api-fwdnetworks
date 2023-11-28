defmodule FwdClient.DeleteDeviceSourcesResult do
  @moduledoc """
  Provides struct and type for a DeleteDeviceSourcesResult
  """

  @type t :: %__MODULE__{devicesDeleted: [String.t()], devicesNotFound: [String.t()]}

  defstruct [:devicesDeleted, :devicesNotFound]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [devicesDeleted: [string: :generic], devicesNotFound: [string: :generic]]
  end
end
