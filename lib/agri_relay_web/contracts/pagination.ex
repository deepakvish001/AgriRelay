defmodule AgriRelayWeb.Contracts.Pagination do
  @moduledoc "Stable API contract for pagination."
  defstruct [:data, :meta, :error]
  def ok(data, meta \\ %{}), do: %__MODULE__{data: data, meta: meta}
  def error(code, message, meta \\ %{}), do: %__MODULE__{error: %{code: code, message: message}, meta: meta}
end
