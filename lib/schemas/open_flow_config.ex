defmodule FwdClient.OpenFlowConfig do
  @moduledoc """
  Provides struct and type for a OpenFlowConfig
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, port: integer | nil}

  defstruct [:__info__, :port]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [port: :integer]
  end
end
