defmodule FwdnetclientTest do
  use ExUnit.Case

  alias FwdClient.Config
  alias FwdClient.Operation

  doctest FwdClient.Config, except: [stack: 1]
  doctest FwdClient.Operation
end
