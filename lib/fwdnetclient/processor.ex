if Mix.env() == :dev do
  defmodule FwdClient.Processor do
    @moduledoc false
    use OpenAPI.Processor

    def operation_docstring(state, operation_spec, params) do
      OpenAPI.Processor.Operation.docstring(state, operation_spec, params)
      |> String.replace("](/", "](https://docs.FwdClient.com/")
    end
  end
end
