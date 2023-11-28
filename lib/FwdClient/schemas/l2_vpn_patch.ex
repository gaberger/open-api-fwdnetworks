defmodule FwdClient.L2VpnPatch do
  @moduledoc """
  Provides struct and type for a L2VpnPatch
  """

  @type t :: %__MODULE__{
          connections: [FwdClient.L2VpnConnection.t()] | nil,
          name: String.t() | nil
        }

  defstruct [:connections, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [connections: [{FwdClient.L2VpnConnection, :t}], name: {:string, :generic}]
  end
end
