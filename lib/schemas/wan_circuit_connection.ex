defmodule FwdClient.WanCircuitConnection do
  @moduledoc """
  Provides struct and type for a WanCircuitConnection
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          device: String.t(),
          name: String.t() | nil,
          port: String.t(),
          vlan: integer | nil
        }

  defstruct [:__info__, :device, :name, :port, :vlan]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      device: {:string, :generic},
      name: {:string, :generic},
      port: {:string, :generic},
      vlan: :integer
    ]
  end
end
