defmodule FwdClient.LinkOverrides do
  @moduledoc """
  Provides struct and type for a LinkOverrides
  """

  @type t :: %__MODULE__{absent: [FwdClient.Link.t()] | nil, present: [FwdClient.Link.t()] | nil}

  defstruct [:absent, :present]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [absent: [{FwdClient.Link, :t}], present: [{FwdClient.Link, :t}]]
  end
end
