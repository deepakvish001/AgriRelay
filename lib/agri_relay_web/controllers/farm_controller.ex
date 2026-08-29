defmodule AgriRelayWeb.Controllers.FarmController do
  use AgriRelayWeb, :controller
  @moduledoc "HTTP controller for farm controller."
  def index(conn, params) do
    json(conn, %{capability: "farm-controller", status: "available", cooperative_scoped: Map.has_key?(params, "cooperative_id")})
  end
end
