defmodule FwdClient.PathSearchResponse do
  @moduledoc """
  Provides struct and type for a PathSearchResponse
  """

  @type t :: %__MODULE__{
          dstIpLocationType: String.t() | nil,
          info: FwdClient.PathInfo.t() | nil,
          queryUrl: String.t() | nil,
          returnPathInfo: FwdClient.PathInfo.t() | nil,
          srcIpLocationType: String.t() | nil,
          timedOut: boolean | nil,
          unrecognizedValues: FwdClient.UnrecognizedValues.t() | nil
        }

  defstruct [
    :dstIpLocationType,
    :info,
    :queryUrl,
    :returnPathInfo,
    :srcIpLocationType,
    :timedOut,
    :unrecognizedValues
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      dstIpLocationType:
        {:enum,
         [
           "HOST",
           "INTERFACE",
           "INTERFACE_ATTACHED_SUBNET",
           "DNAT",
           "INTERNET",
           "ROUTE",
           "MULTICAST"
         ]},
      info: {FwdClient.PathInfo, :t},
      queryUrl: {:string, :generic},
      returnPathInfo: {FwdClient.PathInfo, :t},
      srcIpLocationType:
        {:enum,
         [
           "HOST",
           "INTERFACE",
           "INTERFACE_ATTACHED_SUBNET",
           "SNAT",
           "INTERNET",
           "ROUTE",
           "MULTICAST"
         ]},
      timedOut: :boolean,
      unrecognizedValues: {FwdClient.UnrecognizedValues, :t}
    ]
  end
end
