defmodule FwdClient.EncryptorList do
  @moduledoc """
  Provides struct and type for a EncryptorList
  """

  @type t :: %__MODULE__{encryptors: [FwdClient.Encryptor.t()]}

  defstruct [:encryptors]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [encryptors: [{FwdClient.Encryptor, :t}]]
  end
end
