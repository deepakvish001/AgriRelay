defmodule AgriRelay.MixProject do
  use Mix.Project
  def project, do: [app: :agri_relay, version: "0.1.0", elixir: "~> 1.18", elixirc_paths: elixirc_paths(Mix.env()), start_permanent: Mix.env() == :prod, deps: deps()]
  def application, do: [mod: {AgriRelay.Application, []}, extra_applications: [:logger, :runtime_tools]]
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
  defp deps do
    [
      {:phoenix, "~> 1.7.20"}, {:phoenix_ecto, "~> 4.6"}, {:ecto_sql, "~> 3.12"},
      {:postgrex, ">= 0.0.0"}, {:geo_postgis, "~> 3.7"}, {:phoenix_live_view, "~> 1.0"},
      {:phoenix_html, "~> 4.1"}, {:bandit, "~> 1.6"}, {:jason, "~> 1.4"},
      {:oban, "~> 2.19"}, {:broadway, "~> 1.1"}, {:redix, "~> 1.5"},
      {:opentelemetry_api, "~> 1.5"}, {:opentelemetry_exporter, "~> 1.8"},
      {:opentelemetry_phoenix, "~> 2.0"}, {:plug_cowboy, "~> 2.7"}
    ]
  end
end
