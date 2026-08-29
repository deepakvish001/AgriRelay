defmodule AgriRelayWeb.Controllers.InputController do
  use AgriRelayWeb, :controller
  @moduledoc "HTTP controller for input controller."
  def index(conn, params) do
    json(conn, %{capability: "input-controller", status: "available", cooperative_scoped: Map.has_key?(params, "cooperative_id")})
  end
end
