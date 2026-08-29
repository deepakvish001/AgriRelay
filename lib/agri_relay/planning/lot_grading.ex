defmodule AgriRelay.Planning.LotGrading do
  @moduledoc "Deterministic lot grading evaluation for auditable farm planning."
  def evaluate(%{observed: observed, baseline: baseline} = input)
      when is_number(observed) and is_number(baseline) do
    confidence = Map.get(input, :confidence, 1.0)
    threshold = Map.get(input, :threshold, 0)
    with :ok <- validate_ratio(confidence), true <- is_number(threshold) and threshold >= 0 do
      score = abs(observed - baseline) * confidence
      {:ok, %{score: score, triggered: score >= threshold, reason: "lot grading"}}
    else
      _ -> {:error, :invalid_evaluation_input}
    end
  end
  def evaluate(_), do: {:error, :invalid_evaluation_input}
  defp validate_ratio(value) when is_number(value) and value >= 0 and value <= 1, do: :ok
  defp validate_ratio(_), do: {:error, :invalid_confidence}
end
