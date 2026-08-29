defmodule AgriRelay.Infrastructure.EctoSchemas do
  require Logger
  @moduledoc "Infrastructure adapter for ecto schemas."
  def execute(cooperative_id, payload) when cooperative_id not in [nil, ""] and is_map(payload) do
    Logger.info("ecto-schemas dispatched", cooperative_id: cooperative_id)
    {:ok, Map.merge(payload, %{cooperative_id: cooperative_id, adapter: __MODULE__})}
  end
  def execute(_, _), do: {:error, :invalid_scope}
end
