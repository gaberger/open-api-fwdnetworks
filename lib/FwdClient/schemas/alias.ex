defmodule FwdClient.Alias do
  @moduledoc """
  Provides struct and type for a Alias
  """

  @type t :: %__MODULE__{
          creationTime: integer,
          creatorId: String.t(),
          name: String.t(),
          type: String.t()
        }

  defstruct [:creationTime, :creatorId, :name, :type]

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
