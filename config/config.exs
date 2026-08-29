import Config
config :agri_relay, ecto_repos: [AgriRelay.Repo]
config :agri_relay, Oban, repo: AgriRelay.Repo, plugins: [Oban.Plugins.Pruner], queues: [default: 10, logistics: 20, notifications: 10]
config :agri_relay, AgriRelayWeb.Endpoint, url: [host: "localhost"], adapter: Bandit.PhoenixAdapter, render_errors: [formats: [html: AgriRelayWeb.ErrorHTML, json: AgriRelayWeb.ErrorJSON], layout: false], pubsub_server: AgriRelay.PubSub
config :phoenix, :json_library, Jason
