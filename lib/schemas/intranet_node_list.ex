defmodule FwdClient.IntranetNodeList do
  @moduledoc """
  Provides struct and type for a IntranetNodeList
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, intranetNodes: [FwdClient.IntranetNode.t()]}

  defstruct [:__info__, :intranetNodes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [intranetNodes: [{FwdClient.IntranetNode, :t}]]
  end
end
