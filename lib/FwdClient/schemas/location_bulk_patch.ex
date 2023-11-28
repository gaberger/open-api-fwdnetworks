defmodule FwdClient.LocationBulkPatch do
  @moduledoc """
  Provides struct and type for a LocationBulkPatch
  """

  @type t :: %__MODULE__{
          adminDivision: String.t() | nil,
          city: String.t() | nil,
          country: String.t() | nil,
          id: String.t() | nil,
          lat: number | nil,
          lng: number | nil,
          name: String.t() | nil
        }

  defstruct [:adminDivision, :city, :country, :id, :lat, :lng, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      adminDivision: {:string, :generic},
      city: {:string, :generic},
      country: {:string, :generic},
      id: {:string, :generic},
      lat: :number,
      lng: :number,
      name: {:string, :generic}
    ]
  end
end
