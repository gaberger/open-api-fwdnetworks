defmodule FwdClient.PathSearchQuery do
  @moduledoc """
  Provides struct and type for a PathSearchQuery
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          ack: integer | nil,
          appId: String.t() | nil,
          dstIp: String.t(),
          dstPort: String.t() | nil,
          fin: integer | nil,
          icmpType: integer | nil,
          ipProto: integer | nil,
          psh: integer | nil,
          rst: integer | nil,
          srcIp: String.t(),
          srcPort: String.t() | nil,
          syn: integer | nil,
          urg: integer | nil,
          url: String.t() | nil,
          userGroupId: String.t() | nil,
          userId: String.t() | nil
        }

  defstruct [
    :__info__,
    :ack,
    :appId,
    :dstIp,
    :dstPort,
    :fin,
    :icmpType,
    :ipProto,
    :psh,
    :rst,
    :srcIp,
    :srcPort,
    :syn,
    :urg,
    :url,
    :userGroupId,
    :userId
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ack: :integer,
      appId: {:string, :generic},
      dstIp: {:string, :generic},
      dstPort: {:string, :generic},
      fin: :integer,
      icmpType: :integer,
      ipProto: :integer,
      psh: :integer,
      rst: :integer,
      srcIp: {:string, :generic},
      srcPort: {:string, :generic},
      syn: :integer,
      urg: :integer,
      url: {:string, :generic},
      userGroupId: {:string, :generic},
      userId: {:string, :generic}
    ]
  end
end
