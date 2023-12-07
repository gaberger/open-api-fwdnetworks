defmodule FwdClient.AclFunction do
  @moduledoc """
  Provides struct and type for a AclFunction
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          action: String.t() | nil,
          context: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:__info__, :action, :context, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      action: {:enum, ["PERMIT", "DENY"]},
      context: {:enum, ["INPUT", "OUTPUT"]},
      name: {:string, :generic}
    ]
  end
end
