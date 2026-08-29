defmodule AgriRelayWeb.Controllers.MemberController do
  use AgriRelayWeb, :controller
  @moduledoc "HTTP controller for member controller."
  def index(conn, params) do
    json(conn, %{capability: "member-controller", status: "available", cooperative_scoped: Map.has_key?(params, "cooperative_id")})
  end
end
