defmodule FwdClient.DeviceFile do
  @moduledoc """
  Provides struct and type for a DeviceFile
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          bytes: integer | nil,
          command: String.t() | nil,
          name: String.t() | nil
        }

  defstruct [:__info__, :bytes, :command, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [bytes: :integer, command: {:string, :generic}, name: {:string, :generic}]
  end
end
