defmodule AgriRelayWeb.Components.ErrorPanel do
  use Phoenix.Component
  @moduledoc "Accessible LiveView component for error panel."
  attr :title, :string, required: true
  attr :value, :any, default: nil
  attr :detail, :string, default: nil
  slot :inner_block
  def error_panel(assigns) do
    ~H"""<section class="ag-card" aria-label={@title}><h3>{@title}</h3><strong :if={@value}>{@value}</strong><p :if={@detail}>{@detail}</p>{render_slot(@inner_block)}</section>"""
  end
end
