defmodule AgriRelay.Contexts.SettlementService do
  @moduledoc "Application context for settlement service."
  @required [:cooperative_id, :actor_id, :target_id, :action]
  def execute(command) when is_map(command) do
    missing = Enum.reject(@required, &Map.has_key?(command, &1))
    if missing == [], do: {:ok, Map.put(command, :handled_by, __MODULE__)}, else: {:error, {:missing, missing}}
  end
  def execute(_), do: {:error, :invalid_command}
end
