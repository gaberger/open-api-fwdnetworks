defmodule FwdClient.CollectionSchedules do
  @moduledoc """
  Provides struct and type for a CollectionSchedules
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, schedules: [FwdClient.CollectionSchedule.t()] | nil}

  defstruct [:__info__, :schedules]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [schedules: [{FwdClient.CollectionSchedule, :t}]]
  end
end
