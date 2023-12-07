defmodule FwdClient.TopologyLink do
  @moduledoc """
  Provides struct and type for a TopologyLink
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          sourcePort: String.t() | nil,
          targetPort: String.t() | nil
        }

  defstruct [:__info__, :sourcePort, :targetPort]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [sourcePort: {:string, :generic}, targetPort: {:string, :generic}]
  end
end
