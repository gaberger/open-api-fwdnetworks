defmodule FwdClient.LinkOverridesEdit do
  @moduledoc """
  Provides struct and type for a LinkOverridesEdit
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          absentAdditions: [FwdClient.Link.t()] | nil,
          absentRemovals: [FwdClient.Link.t()] | nil,
          presentAdditions: [FwdClient.Link.t()] | nil,
          presentRemovals: [FwdClient.Link.t()] | nil
        }

  defstruct [:__info__, :absentAdditions, :absentRemovals, :presentAdditions, :presentRemovals]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      absentAdditions: [{FwdClient.Link, :t}],
      absentRemovals: [{FwdClient.Link, :t}],
      presentAdditions: [{FwdClient.Link, :t}],
      presentRemovals: [{FwdClient.Link, :t}]
    ]
  end
end
