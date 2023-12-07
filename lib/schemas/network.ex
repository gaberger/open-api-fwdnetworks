defmodule FwdClient.Network do
  @moduledoc """
  Provides struct and type for a Network
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          createdAt: integer | nil,
          creator: String.t() | nil,
          creatorId: String.t() | nil,
          id: String.t(),
          name: String.t(),
          note: String.t() | nil,
          orgId: String.t(),
          parentId: String.t() | nil
        }

  defstruct [:__info__, :createdAt, :creator, :creatorId, :id, :name, :note, :orgId, :parentId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      createdAt: :integer,
      creator: {:string, :generic},
      creatorId: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      note: {:string, :generic},
      orgId: {:string, :generic},
      parentId: {:string, :generic}
    ]
  end
end
