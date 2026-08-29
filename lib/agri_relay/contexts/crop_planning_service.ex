defmodule AgriRelay.Contexts.CropPlanningService do
  @required ~w(cooperative_id actor_id target_id action)a
  def execute(command) when is_map(command) do
    if Enum.all?(@required, &Map.has_key?(command, &1)) and command.action not in [nil, ""] do
      {:ok, %{target_id: command.target_id, accepted: true, reason: :validated_for_persistence}}
    else
      {:error, :invalid_command_scope}
    end
  end
end
