defmodule AgriRelayWeb.Controllers.MachineryController do
  use AgriRelayWeb, :controller
  @moduledoc "HTTP controller for machinery controller."
  def index(conn, params) do
    json(conn, %{capability: "machinery-controller", status: "available", cooperative_scoped: Map.has_key?(params, "cooperative_id")})
  end
end
