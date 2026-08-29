defmodule AgriRelay.Application do
  use Application
  @impl true
  def start(_type, _args) do
    children = [AgriRelay.Repo, {Phoenix.PubSub, name: AgriRelay.PubSub}, AgriRelayWeb.Endpoint, {Oban, Application.fetch_env!(:agri_relay, Oban)}]
    Supervisor.start_link(children, strategy: :one_for_one, name: AgriRelay.Supervisor)
  end
  @impl true
  def config_change(changed, _new, removed), do: AgriRelayWeb.Endpoint.config_change(changed, removed)
end
