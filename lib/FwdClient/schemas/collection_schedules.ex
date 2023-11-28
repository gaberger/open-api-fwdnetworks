defmodule FwdClient.CollectionSchedules do
  @moduledoc """
  Provides struct and type for a CollectionSchedules
  """

  @type t :: %__MODULE__{schedules: [FwdClient.CollectionSchedule.t()] | nil}

  defstruct [:schedules]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [schedules: [{FwdClient.CollectionSchedule, :t}]]
  end
end
