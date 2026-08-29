defmodule AgriRelay.Security.TenantContext do
  @moduledoc "Security boundary for tenant context."
  @redacted "[REDACTED]"
  def allowed?(%{permissions: permissions}, action) when is_list(permissions), do: action in permissions or :* in permissions
  def allowed?(_, _), do: false
  def redact(data) when is_map(data), do: Map.new(data, fn {k,v} -> {k, if(k in [:password,:token,:secret], do: @redacted, else: v)} end)
  def redact(value), do: value
end
