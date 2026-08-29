defmodule AgriRelayWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :agri_relay
  @session_options [store: :cookie, key: "_agri_relay_key", signing_salt: {AgriRelayWeb.SessionSalt, :value, []}]
  socket "/live", Phoenix.LiveView.Socket, websocket: [connect_info: [session: @session_options]]
  plug Plug.Static, at: "/", from: :agri_relay
  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]
  plug Plug.Parsers, parsers: [:urlencoded, :multipart, :json], pass: ["*/*"], json_decoder: Phoenix.json_library()
  plug Plug.Session, @session_options
  plug AgriRelayWeb.Router
end

defmodule AgriRelayWeb.SessionSalt do
  def value, do: System.fetch_env!("SESSION_SIGNING_SALT")
end
