defmodule FwdClient.Path do
  @moduledoc """
  Provides struct and type for a Path
  """

  @type t :: %__MODULE__{
          forwardingOutcome: String.t() | nil,
          hops: [FwdClient.PathHop.t()] | nil,
          securityOutcome: String.t() | nil
        }

  defstruct [:forwardingOutcome, :hops, :securityOutcome]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      forwardingOutcome:
        {:enum,
         [
           "DELIVERED",
           "DELIVERED_TO_INCORRECT_LOCATION",
           "DROPPED",
           "LOOP",
           "INADMISSIBLE",
           "BLACKHOLE",
           "UNREACHABLE"
         ]},
      hops: [{FwdClient.PathHop, :t}],
      securityOutcome: {:enum, ["PERMITTED", "DENIED"]}
    ]
  end
end
