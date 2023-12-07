defmodule FwdClient.ErrorInfo do
  @moduledoc """
  Provides struct and type for a ErrorInfo
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          apiUrl: String.t() | nil,
          httpMethod: String.t() | nil,
          message: String.t() | nil,
          reason: String.t() | nil
        }

  defstruct [:__info__, :apiUrl, :httpMethod, :message, :reason]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apiUrl: {:string, :generic},
      httpMethod: {:enum, ["GET", "HEAD", "POST", "PUT", "PATCH", "DELETE", "OPTIONS", "TRACE"]},
      message: {:string, :generic},
      reason: {:string, :generic}
    ]
  end
end
