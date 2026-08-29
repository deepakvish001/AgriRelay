defmodule AgriRelayWeb.Components.EmptyState do
  use Phoenix.Component
  @moduledoc "Accessible LiveView component for empty state."
  attr :title, :string, required: true
  attr :value, :any, default: nil
  attr :detail, :string, default: nil
  slot :inner_block
  def empty_state(assigns) do
    ~H"""<section class="ag-card" aria-label={@title}><h3>{@title}</h3><strong :if={@value}>{@value}</strong><p :if={@detail}>{@detail}</p>{render_slot(@inner_block)}</section>"""
  end
end
