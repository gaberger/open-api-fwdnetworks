defmodule FwdClient.DeviceCluster do
  @moduledoc """
  Provides struct and type for a DeviceCluster
  """

  @type t :: %__MODULE__{devices: [String.t()], name: String.t()}

  defstruct [:devices, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [devices: [string: :generic], name: {:string, :generic}]
  end
end
