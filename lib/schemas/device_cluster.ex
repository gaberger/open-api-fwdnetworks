defmodule FwdClient.DeviceCluster do
  @moduledoc """
  Provides struct and type for a DeviceCluster
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, devices: [String.t()], name: String.t()}

  defstruct [:__info__, :devices, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [devices: [string: :generic], name: {:string, :generic}]
  end
end
