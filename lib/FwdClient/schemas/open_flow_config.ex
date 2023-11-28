defmodule FwdClient.OpenFlowConfig do
  @moduledoc """
  Provides struct and type for a OpenFlowConfig
  """

  @type t :: %__MODULE__{port: integer | nil}

  defstruct [:port]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [port: :integer]
  end
end
