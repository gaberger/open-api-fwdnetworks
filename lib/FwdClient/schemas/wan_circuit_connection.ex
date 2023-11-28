defmodule FwdClient.WanCircuitConnection do
  @moduledoc """
  Provides struct and type for a WanCircuitConnection
  """

  @type t :: %__MODULE__{
          device: String.t(),
          name: String.t() | nil,
          port: String.t(),
          vlan: integer | nil
        }

  defstruct [:device, :name, :port, :vlan]

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
