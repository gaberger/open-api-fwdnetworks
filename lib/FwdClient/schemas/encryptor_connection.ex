defmodule FwdClient.EncryptorConnection do
  @moduledoc """
  Provides struct and type for a EncryptorConnection
  """

  @type t :: %__MODULE__{
          gatewayPort: FwdClient.DevicePort.t() | nil,
          name: String.t() | nil,
          uplinkPort: FwdClient.DevicePort.t(),
          vlan: integer | nil
        }

  defstruct [:gatewayPort, :name, :uplinkPort, :vlan]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      gatewayPort: {FwdClient.DevicePort, :t},
      name: {:string, :generic},
      uplinkPort: {FwdClient.DevicePort, :t},
      vlan: :integer
    ]
  end
end
