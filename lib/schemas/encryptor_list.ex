defmodule FwdClient.EncryptorList do
  @moduledoc """
  Provides struct and type for a EncryptorList
  """
  use FwdClient.Encoder

  @type t :: %__MODULE__{__info__: map, encryptors: [FwdClient.Encryptor.t()]}

  defstruct [:__info__, :encryptors]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [encryptors: [{FwdClient.Encryptor, :t}]]
  end
end
