defmodule AgriRelayWeb.Controllers.SettlementController do
  use AgriRelayWeb, :controller
  @moduledoc "HTTP controller for settlement controller."
  def index(conn, params) do
    json(conn, %{capability: "settlement-controller", status: "available", cooperative_scoped: Map.has_key?(params, "cooperative_id")})
  end
end
