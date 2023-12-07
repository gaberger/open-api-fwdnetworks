defmodule FwdClient.LinkOverrides do
  @moduledoc """
  Provides struct and type for a LinkOverrides
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          absent: [FwdClient.Link.t()] | nil,
          present: [FwdClient.Link.t()] | nil
        }

  defstruct [:__info__, :absent, :present]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [absent: [{FwdClient.Link, :t}], present: [{FwdClient.Link, :t}]]
  end
end
