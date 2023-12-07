defmodule FwdClient.L3VpnPatch do
  @moduledoc """
  Provides struct and type for a L3VpnPatch
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          connections: [FwdClient.L3VpnConnection.t()] | nil,
          name: String.t() | nil
        }

  defstruct [:__info__, :connections, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [connections: [{FwdClient.L3VpnConnection, :t}], name: {:string, :generic}]
  end
end
