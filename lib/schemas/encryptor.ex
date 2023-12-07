defmodule FwdClient.Encryptor do
  @moduledoc """
  Provides struct and type for a Encryptor
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          name: String.t(),
          siteConnection: FwdClient.EncryptorConnection.t(),
          subnets: [String.t()] | nil,
          tunnels: [FwdClient.EncryptorTunnel.t()],
          underlayConnection: FwdClient.EncryptorConnection.t()
        }

  defstruct [:__info__, :name, :siteConnection, :subnets, :tunnels, :underlayConnection]

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
