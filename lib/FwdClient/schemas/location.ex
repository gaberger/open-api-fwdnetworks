defmodule FwdClient.Location do
  @moduledoc """
  Provides struct and type for a Location
  """

  @type t :: %__MODULE__{
          adminDivision: String.t() | nil,
          city: String.t() | nil,
          country: String.t() | nil,
          id: String.t(),
          lat: number,
          lng: number,
          name: String.t()
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
