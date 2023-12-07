defmodule FwdClient.DeviceCredentialUpdate do
  @moduledoc """
  Provides struct and type for a DeviceCredentialUpdate
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          content: String.t() | nil,
          loginType: String.t() | nil,
          name: String.t() | nil,
          password: String.t() | nil,
          type: String.t(),
          username: String.t() | nil
        }

  defstruct [:__info__, :content, :loginType, :name, :password, :type, :username]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      content: {:string, :generic},
      loginType: {:enum, ["LOCAL", "RADIUS", "TACACS", "OAUTH", "JWT", "SAML"]},
      name: {:string, :generic},
      password: {:string, :generic},
      type: {:enum, ["LOGIN", "PRIVILEGED_MODE", "SHELL", "KEY_STORE", "API_KEY"]},
      username: {:string, :generic}
    ]
  end
end
