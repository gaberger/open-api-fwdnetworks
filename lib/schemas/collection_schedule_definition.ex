defmodule FwdClient.CollectionScheduleDefinition do
  @moduledoc """
  Provides struct and type for a CollectionScheduleDefinition
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          daysOfTheWeek: [integer],
          enabled: boolean,
          endAt: String.t() | nil,
          periodInSeconds: integer | nil,
          startAt: String.t() | nil,
          timeZone: String.t() | nil,
          times: String.t() | nil
        }

  defstruct [
    :__info__,
    :daysOfTheWeek,
    :enabled,
    :endAt,
    :periodInSeconds,
    :startAt,
    :timeZone,
    :times
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      daysOfTheWeek: [:integer],
      enabled: :boolean,
      endAt: {:string, :generic},
      periodInSeconds: :integer,
      startAt: {:string, :generic},
      timeZone:
        {:enum,
         [
           "UTC",
           "AFRICA_ACCRA",
           "AFRICA_ADDIS_ABABA",
           "AFRICA_ALGIERS",
           "AFRICA_CAIRO",
           "AFRICA_DAR_ES_SALAAM",
           "AFRICA_JOHANNESBURG",
           "AFRICA_KHARTOUM",
           "AFRICA_KINSHASA",
           "AFRICA_LAGOS",
           "AFRICA_LUANDA",
           "AFRICA_MAPUTO",
           "AMERICA_ARGENTINA_BUENOS_AIRES",
           "AMERICA_BOGOTA",
           "AMERICA_CHICAGO",
           "AMERICA_DENVER",
           "AMERICA_LIMA",
           "AMERICA_LOS_ANGELES",
           "AMERICA_MEXICO_CITY",
           "AMERICA_NEW_YORK",
           "AMERICA_PHOENIX",
           "AMERICA_SANTIAGO",
           "AMERICA_SAO_PAULO",
           "AMERICA_TORONTO",
           "ASIA_AMMAN",
           "ASIA_BAGHDAD",
           "ASIA_BANGKOK",
           "ASIA_BEIRUT",
           "ASIA_DHAKA",
           "ASIA_HO_CHI_MINH",
           "ASIA_HONG_KONG",
           "ASIA_JAKARTA",
           "ASIA_JERUSALEM",
           "ASIA_KARACHI",
           "ASIA_KOLKATA",
           "ASIA_KUALA_LUMPUR",
           "ASIA_MANILA",
           "ASIA_RIYADH",
           "ASIA_SEOUL",
           "ASIA_SHANGHAI",
           "ASIA_SINGAPORE",
           "ASIA_TEHRAN",
           "ASIA_TOKYO",
           "ASIA_YANGON",
           "AUSTRALIA_ADELAIDE",
           "AUSTRALIA_EUCLA",
           "AUSTRALIA_PERTH",
           "AUSTRALIA_SYDNEY",
           "EUROPE_BELGRADE",
           "EUROPE_BERLIN",
           "EUROPE_ISTANBUL",
           "EUROPE_LONDON",
           "EUROPE_MADRID",
           "EUROPE_MOSCOW",
           "EUROPE_PARIS",
           "EUROPE_ROME"
         ]},
      times: {:string, :generic}
    ]
  end
end
