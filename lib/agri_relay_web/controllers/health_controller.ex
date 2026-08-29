defmodule AgriRelayWeb.Controllers.HealthController do
  use AgriRelayWeb, :controller
  @moduledoc "HTTP controller for health controller."
  def index(conn, params) do
    json(conn, %{capability: "health-controller", status: "available", cooperative_scoped: Map.has_key?(params, "cooperative_id")})
  end
end
