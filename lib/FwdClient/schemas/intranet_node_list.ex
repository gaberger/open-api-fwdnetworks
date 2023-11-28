defmodule FwdClient.IntranetNodeList do
  @moduledoc """
  Provides struct and type for a IntranetNodeList
  """

  @type t :: %__MODULE__{intranetNodes: [FwdClient.IntranetNode.t()]}

  defstruct [:intranetNodes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [intranetNodes: [{FwdClient.IntranetNode, :t}]]
  end
end
