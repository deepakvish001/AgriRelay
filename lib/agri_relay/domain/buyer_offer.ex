defmodule AgriRelay.Domain.BuyerOffer do
  @enforce_keys [:id, :cooperative_id, :reference, :status]
  defstruct [:id, :cooperative_id, :reference, :status, :recorded_at, active: true]
  def new(attrs) when is_map(attrs) do
    value = struct!(__MODULE__, attrs)
    cond do
      is_nil(value.id) or is_nil(value.cooperative_id) or value.id == value.cooperative_id -> {:error, :invalid_identity}
      not is_binary(value.reference) or String.trim(value.reference) == "" -> {:error, :reference_required}
      not is_binary(value.status) or String.trim(value.status) == "" -> {:error, :status_required}
      true -> {:ok, value}
    end
  end
end
