defmodule AgriRelay.Ports.CropPlanRepository do
  @moduledoc "Persistence port for crop plan repository."
  @callback get(cooperative_id :: term(), id :: term()) :: {:ok, map()} | {:error, term()}
  @callback save(cooperative_id :: term(), record :: map()) :: {:ok, map()} | {:error, term()}
  @callback list(cooperative_id :: term(), opts :: keyword()) :: {:ok, [map()]} | {:error, term()}
end
