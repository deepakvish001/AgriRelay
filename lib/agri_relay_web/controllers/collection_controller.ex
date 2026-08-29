defmodule AgriRelayWeb.Controllers.CollectionController do
  use AgriRelayWeb, :controller
  @moduledoc "HTTP controller for collection controller."
  def index(conn, params) do
    json(conn, %{capability: "collection-controller", status: "available", cooperative_scoped: Map.has_key?(params, "cooperative_id")})
  end
end
