defmodule AgriRelayWeb.Components.LotCard do
  use Phoenix.Component
  attr :title, :string, required: true
  attr :value, :any, default: nil
  attr :detail, :string, default: nil
  slot :inner_block
  def render(assigns) do
    ~H"""
    <section class="lot-card" aria-label={@title}><header><h3>{@title}</h3></header><strong :if={@value}>{@value}</strong><p :if={@detail}>{@detail}</p>{render_slot(@inner_block)}</section>
    """
  end
end
