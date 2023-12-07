defmodule FwdClient.DevicePort do
  @moduledoc """
  Provides struct and type for a DevicePort
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, device: String.t() | nil, port: String.t() | nil}

  defstruct [:__info__, :device, :port]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [device: {:string, :generic}, port: {:string, :generic}]
  end
end
