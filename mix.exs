defmodule Openapifwdnetworks.MixProject do
  use Mix.Project

  def project do
    [
      app: :openapifwdnetworks,
      version: "0.1.0",
      deps: deps(),
      elixir: "~> 1.15.7",
      start_permanent: Mix.env() == :prod,
      name: "FwdClient",
      # docs: [main: "FwdClient", extras: ["README.md"]],
      docs: docs(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:oapi_generator, "~> 0.0.8"},
      {:oapi_generator, "0.1.0-rc.3", only: :dev, runtime: false},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: [
        "README.md": [title: "Overview"],
      ],
      groups_for_modules: [
        Client: [
          FwdClient
        ],
        Operations: [
          FwdClient.Aliases,
          FwdClient.Checks,
          FwdClient.CurrentVersion,
          FwdClient.NetworkCollection,
          FwdClient.NetworkDevices,
          FwdClient.NetworkLocations,
          FwdClient.NetworkSetup,
          FwdClient.NetworkSnapshots,
          FwdClient.NetworkTopology,
          FwdClient.Networks,
          FwdClient.Nqe,
          FwdClient.PathSearch,
          FwdClient.SyntheticDevices,
          FwdClient.SystemAdministration,
          FwdClient.VulnerabilityAnalysis
        ],
        Schemas: ~r//
      ]
    ]
  end
end
