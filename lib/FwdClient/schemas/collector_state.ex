defmodule FwdClient.CollectorState do
  @moduledoc """
  Provides struct and type for a CollectorState
  """

  @type t :: %__MODULE__{
          busyStatus: String.t() | nil,
          hasDevicesConfigured: boolean | nil,
          isIdle: boolean | nil,
          isOnline: boolean | nil,
          isSet: boolean | nil
        }

  defstruct [:busyStatus, :hasDevicesConfigured, :isIdle, :isOnline, :isSet]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      busyStatus:
        {:enum,
         [
           "OFFLINE",
           "IDLE",
           "TESTING",
           "COLLECTING",
           "COLLECTION_QUEUED",
           "DISCOVERING",
           "UPDATING"
         ]},
      hasDevicesConfigured: :boolean,
      isIdle: :boolean,
      isOnline: :boolean,
      isSet: :boolean
    ]
  end
end
