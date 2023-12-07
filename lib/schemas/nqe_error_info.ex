defmodule FwdClient.NqeErrorInfo do
  @moduledoc """
  Provides struct and type for a NqeErrorInfo
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          apiUrl: String.t() | nil,
          completionType: String.t() | nil,
          errors: [FwdClient.NqeQueryError.t()] | nil,
          httpMethod: String.t() | nil,
          message: String.t() | nil,
          reason: String.t() | nil,
          snapshotId: String.t() | nil
        }

  defstruct [
    :__info__,
    :apiUrl,
    :completionType,
    :errors,
    :httpMethod,
    :message,
    :reason,
    :snapshotId
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      apiUrl: {:string, :generic},
      completionType: {:enum, ["FINISHED", "CANCELED", "TIMED_OUT"]},
      errors: [{FwdClient.NqeQueryError, :t}],
      httpMethod: {:enum, ["GET", "HEAD", "POST", "PUT", "PATCH", "DELETE", "OPTIONS", "TRACE"]},
      message: {:string, :generic},
      reason: {:string, :generic},
      snapshotId: {:string, :generic}
    ]
  end
end
