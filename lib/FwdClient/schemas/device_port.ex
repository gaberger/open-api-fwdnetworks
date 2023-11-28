defmodule FwdClient.DevicePort do
  @moduledoc """
  Provides struct and type for a DevicePort
  """

  @type t :: %__MODULE__{device: String.t() | nil, port: String.t() | nil}

  defstruct [:device, :port]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [device: {:string, :generic}, port: {:string, :generic}]
  end
end
