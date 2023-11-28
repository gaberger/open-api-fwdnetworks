defmodule FwdClient.CheckDefinition do
  @moduledoc """
  Provides struct and type for a CheckDefinition
  """

  @type t :: %__MODULE__{checkType: String.t()}

  defstruct [:checkType]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      checkType:
        {:enum,
         ["Isolation", "Reachability", "Existential", "QueryStringBased", "Predefined", "NQE"]}
    ]
  end
end
