defmodule AgriRelayWeb.Controllers.OfferController do
  use AgriRelayWeb, :controller
  @moduledoc "HTTP controller for offer controller."
  def index(conn, params) do
    json(conn, %{capability: "offer-controller", status: "available", cooperative_scoped: Map.has_key?(params, "cooperative_id")})
  end
end
