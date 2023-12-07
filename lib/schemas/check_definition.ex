defmodule FwdClient.CheckDefinition do
  @moduledoc """
  Provides struct and type for a CheckDefinition
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, checkType: String.t()}

  defstruct [:__info__, :checkType]

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
