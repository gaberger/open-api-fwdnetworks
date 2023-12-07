defmodule FwdClient.UnrecognizedValues do
  @moduledoc """
  Provides struct and type for a UnrecognizedValues
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          appId: [String.t()] | nil,
          userGroupId: [String.t()] | nil,
          userId: [String.t()] | nil
        }

  defstruct [:__info__, :appId, :userGroupId, :userId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [appId: [string: :generic], userGroupId: [string: :generic], userId: [string: :generic]]
  end
end
