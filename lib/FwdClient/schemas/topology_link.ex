defmodule FwdClient.TopologyLink do
  @moduledoc """
  Provides struct and type for a TopologyLink
  """

  @type t :: %__MODULE__{sourcePort: String.t() | nil, targetPort: String.t() | nil}

  defstruct [:sourcePort, :targetPort]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [sourcePort: {:string, :generic}, targetPort: {:string, :generic}]
  end
end
