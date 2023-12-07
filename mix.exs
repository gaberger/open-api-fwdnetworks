defmodule FwdClient.MixProject do
  use Mix.Project

  def project do
    [
      app: :oapi_fwdnetclient,
      version: "0.1.0",
      deps: deps(),
      elixir: "~> 1.15.7",
      start_permanent: Mix.env() == :prod,
      name: "FwdClient",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    if Mix.env() == :prod do
      [
        extra_applications: [:logger]
      ]
    else
      [
        extra_applications: [:logger, :hackney]
      ]
    end
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},
      {:faker, "~> 0.15"},
      {:jason, "~> 1.0", optional: true},
      {:httpoison, "~> 2.2"},
      {:oapi_generator, "0.1.0-rc.3", only: :dev, runtime: false},
      {:opentelemetry_api, "~> 1.0", optional: true},
      {:opentelemetry_semantic_conventions, "~> 0.2", optional: true},
      {:telemetry, "~> 0.4.2 or ~> 1.0"}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: [
        "README.md": [title: "Overview"]
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
