defmodule AgriRelay.Infrastructure.EventPipeline do
  require Logger
  @moduledoc "Infrastructure adapter for event pipeline."
  def execute(cooperative_id, payload) when cooperative_id not in [nil, ""] and is_map(payload) do
    Logger.info("event-pipeline dispatched", cooperative_id: cooperative_id)
    {:ok, Map.merge(payload, %{cooperative_id: cooperative_id, adapter: __MODULE__})}
  end
  def execute(_, _), do: {:error, :invalid_scope}
end
