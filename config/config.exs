import Config

config :oapi_generator,
  default: [
    output: [
      base_module: FwdClient,
      location: "lib/FwdClient",
      operation_subdirectory: "operations/",
      schema_subdirectory: "schemas/"
    ]
    # naming: [
    #   group: [AclFunction, Alias]
    # ]
  ]
