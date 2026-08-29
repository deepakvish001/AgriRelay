defmodule AgriRelay.Ports.OutboxRepository do
  @moduledoc "Persistence port for outbox repository."
  @callback get(cooperative_id :: term(), id :: term()) :: {:ok, map()} | {:error, term()}
  @callback save(cooperative_id :: term(), record :: map()) :: {:ok, map()} | {:error, term()}
  @callback list(cooperative_id :: term(), opts :: keyword()) :: {:ok, [map()]} | {:error, term()}
end
