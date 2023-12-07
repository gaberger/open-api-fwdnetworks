defmodule FwdClient.MissingDevices do
  @moduledoc """
  Provides struct and type for a MissingDevices
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, devices: [FwdClient.MissingDevice.t()] | nil}

  defstruct [:__info__, :devices]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [devices: [{FwdClient.MissingDevice, :t}]]
  end
end
