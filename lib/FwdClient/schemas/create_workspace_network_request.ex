defmodule FwdClient.CreateWorkspaceNetworkRequest do
  @moduledoc """
  Provides struct and type for a CreateWorkspaceNetworkRequest
  """

  @type t :: %__MODULE__{
          cloudAccounts: [String.t()] | nil,
          devices: [String.t()] | nil,
          name: String.t(),
          note: String.t() | nil,
          omissions: [String.t()] | nil,
          vcenters: [String.t()] | nil
        }

  defstruct [:cloudAccounts, :devices, :name, :note, :omissions, :vcenters]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      cloudAccounts: [string: :generic],
      devices: [string: :generic],
      name: {:string, :generic},
      note: {:string, :generic},
      omissions: [enum: ["CUSTOM_COMMANDS", "NQE_CHECKS", "PREDEFINED_CHECKS", "INTENT_CHECKS"]],
      vcenters: [string: :generic]
    ]
  end
end
