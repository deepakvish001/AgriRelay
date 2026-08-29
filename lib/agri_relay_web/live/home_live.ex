defmodule AgriRelayWeb.HomeLive do
  use Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <main class="shell">
      <p class="eyebrow">COOPERATIVE FARM OPERATIONS</p>
      <h1>Coordinate harvests from field to fair market.</h1>
      <p class="lede">AgriRelay connects crop plans, shared resources, collection centers, quality lots and cold-chain pickups.</p>
      <section class="metrics" aria-label="Platform capabilities">
        <article><strong>Shared</strong><span>inputs and machinery</span></article>
        <article><strong>Traceable</strong><span>quality and logistics</span></article>
        <article><strong>Fair</strong><span>cooperative settlements</span></article>
      </section>
    </main>
    """
  end
end
