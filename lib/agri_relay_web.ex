defmodule AgriRelayWeb do
  def controller do quote do use Phoenix.Controller, formats: [:html, :json]; import Plug.Conn end end
  def live_view do quote do use Phoenix.LiveView, layout: {AgriRelayWeb.Layouts, :app} end end
  def router do quote do use Phoenix.Router end end
  defmacro __using__(which), do: apply(__MODULE__, which, [])
end
