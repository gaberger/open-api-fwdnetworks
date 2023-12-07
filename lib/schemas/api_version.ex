defmodule FwdClient.ApiVersion do
  @moduledoc """
  Provides struct and type for a ApiVersion
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          build: String.t() | nil,
          release: String.t() | nil,
          version: String.t() | nil
        }

  defstruct [:__info__, :build, :release, :version]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [build: {:string, :generic}, release: {:string, :generic}, version: {:string, :generic}]
  end
end
