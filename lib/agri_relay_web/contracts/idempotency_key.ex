defmodule AgriRelayWeb.Contracts.IdempotencyKey do
  @moduledoc "Stable API contract for idempotency key."
  defstruct [:data, :meta, :error]
  def ok(data, meta \\ %{}), do: %__MODULE__{data: data, meta: meta}
  def error(code, message, meta \\ %{}), do: %__MODULE__{error: %{code: code, message: message}, meta: meta}
end
