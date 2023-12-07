import Config

if config_env() == :dev do
  config :oapi_generator,
    default: [
      output: [
        base_module: FwdClient,
        location: "lib/",
        operation_subdirectory: "operations/",
        schema_subdirectory: "schemas/",
        extra_fields: [__info__: :map],
        schema_use: FwdClient.Encoder,
        types: [
          error: {FwdClient.Error, :t}
        ]
      ]
      # naming: [
      #   group: [AclFunction, Alias]
      # ]
    ]
end

# Test configuration
if System.get_env("FWD_USER") do
  config :oapi_fwdnetclient,
    app_name: "Test App",
    default_auth: {System.fetch_env!("FWD_USER"), System.fetch_env!("FWD_PASSWORD")}
else
  config :oapi_fwdnetclient,
    app_name: "Test App",
    default_auth: {"foo", "bar"}
end
