defmodule FwdClient.NewNetworkCheck do
  @moduledoc """
  Provides struct and type for a NewNetworkCheck
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          definition: FwdClient.CheckDefinition.t(),
          enabled: boolean | nil,
          name: String.t() | nil,
          note: String.t() | nil,
          priority: String.t() | nil,
          tags: [String.t()] | nil
        }

  defstruct [:__info__, :definition, :enabled, :name, :note, :priority, :tags]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      definition: {FwdClient.CheckDefinition, :t},
      enabled: :boolean,
      name: {:string, :generic},
      note: {:string, :generic},
      priority: {:enum, ["NOT_SET", "LOW", "MEDIUM", "HIGH"]},
      tags: [string: :generic]
    ]
  end
end
