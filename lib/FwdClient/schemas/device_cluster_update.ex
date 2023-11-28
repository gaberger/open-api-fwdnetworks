defmodule FwdClient.DeviceClusterUpdate do
  @moduledoc """
  Provides struct and type for a DeviceClusterUpdate
  """

  @type t :: %__MODULE__{devices: [String.t()] | nil, name: String.t() | nil}

  defstruct [:devices, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [devices: [string: :generic], name: {:string, :generic}]
  end
end
