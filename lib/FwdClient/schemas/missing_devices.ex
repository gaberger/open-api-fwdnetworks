defmodule FwdClient.MissingDevices do
  @moduledoc """
  Provides struct and type for a MissingDevices
  """

  @type t :: %__MODULE__{devices: [FwdClient.MissingDevice.t()] | nil}

  defstruct [:devices]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [devices: [{FwdClient.MissingDevice, :t}]]
  end
end
