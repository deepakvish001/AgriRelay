defmodule AgriRelayWeb.Controllers.LotController do
  use AgriRelayWeb, :controller
  @moduledoc "HTTP controller for lot controller."
  def index(conn, params) do
    json(conn, %{capability: "lot-controller", status: "available", cooperative_scoped: Map.has_key?(params, "cooperative_id")})
  end
end
