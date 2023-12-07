defmodule FwdClient.DeleteDeviceSourcesResult do
  @moduledoc """
  Provides struct and type for a DeleteDeviceSourcesResult
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          devicesDeleted: [String.t()],
          devicesNotFound: [String.t()]
        }

  defstruct [:__info__, :devicesDeleted, :devicesNotFound]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [devicesDeleted: [string: :generic], devicesNotFound: [string: :generic]]
  end
end
