defmodule AgriRelayWeb.Controllers.CropPlanController do
  use AgriRelayWeb, :controller
  @moduledoc "HTTP controller for crop plan controller."
  def index(conn, params) do
    json(conn, %{capability: "crop-plan-controller", status: "available", cooperative_scoped: Map.has_key?(params, "cooperative_id")})
  end
end
