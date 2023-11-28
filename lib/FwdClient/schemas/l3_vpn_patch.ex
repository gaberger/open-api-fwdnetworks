defmodule FwdClient.L3VpnPatch do
  @moduledoc """
  Provides struct and type for a L3VpnPatch
  """

  @type t :: %__MODULE__{
          connections: [FwdClient.L3VpnConnection.t()] | nil,
          name: String.t() | nil
        }

  defstruct [:connections, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [connections: [{FwdClient.L3VpnConnection, :t}], name: {:string, :generic}]
  end
end
