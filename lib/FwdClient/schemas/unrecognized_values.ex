defmodule FwdClient.UnrecognizedValues do
  @moduledoc """
  Provides struct and type for a UnrecognizedValues
  """

  @type t :: %__MODULE__{
          appId: [String.t()] | nil,
          userGroupId: [String.t()] | nil,
          userId: [String.t()] | nil
        }

  defstruct [:appId, :userGroupId, :userId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [appId: [string: :generic], userGroupId: [string: :generic], userId: [string: :generic]]
  end
end
