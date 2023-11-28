defmodule FwdClient.JumpServer do
  @moduledoc """
  Provides struct and type for a JumpServer
  """

  @type t :: %__MODULE__{
          commandFormat: String.t() | nil,
          host: String.t(),
          id: String.t() | nil,
          password: String.t() | nil,
          port: integer | nil,
          supportsPortForwarding: boolean | nil,
          username: String.t()
        }

  defstruct [:commandFormat, :host, :id, :password, :port, :supportsPortForwarding, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      commandFormat: {:enum, ["NONE", "UNIX", "CISCO_IOS", "JUNOS"]},
      host: {:string, :generic},
      id: {:string, :generic},
      password: {:string, :generic},
      port: :integer,
      supportsPortForwarding: :boolean,
      username: {:string, :generic}
    ]
  end
end
