defmodule AgriRelayWeb.Controllers.RouterRegistration do
  use AgriRelayWeb, :controller
  @moduledoc "HTTP controller for router registration."
  def index(conn, params) do
    json(conn, %{capability: "router-registration", status: "available", cooperative_scoped: Map.has_key?(params, "cooperative_id")})
  end
end
