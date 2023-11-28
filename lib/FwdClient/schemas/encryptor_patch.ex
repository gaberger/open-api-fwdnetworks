defmodule FwdClient.EncryptorPatch do
  @moduledoc """
  Provides struct and type for a EncryptorPatch
  """

  @type t :: %__MODULE__{
          name: String.t() | nil,
          siteConnection: FwdClient.EncryptorConnection.t() | nil,
          subnets: [String.t()] | nil,
          tunnels: [FwdClient.EncryptorTunnel.t()] | nil,
          underlayConnection: FwdClient.EncryptorConnection.t() | nil
        }

  defstruct [:name, :siteConnection, :subnets, :tunnels, :underlayConnection]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      name: {:string, :generic},
      siteConnection: {FwdClient.EncryptorConnection, :t},
      subnets: [string: :generic],
      tunnels: [{FwdClient.EncryptorTunnel, :t}],
      underlayConnection: {FwdClient.EncryptorConnection, :t}
    ]
  end
end
