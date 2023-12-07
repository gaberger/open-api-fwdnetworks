defmodule FwdClient.Alias do
  @moduledoc """
  Provides struct and type for a Alias
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          creationTime: integer,
          creatorId: String.t(),
          name: String.t(),
          type: String.t()
        }

  defstruct [:__info__, :creationTime, :creatorId, :name, :type]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      creationTime: :integer,
      creatorId: {:string, :generic},
      name: {:string, :generic},
      type: {:enum, ["HOSTS", "DEVICES", "INTERFACES", "HEADERS", "LOGICAL_NETWORK"]}
    ]
  end
end
