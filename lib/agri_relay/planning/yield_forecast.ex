defmodule AgriRelay.Planning.YieldForecast do
  @type input :: %{observed: number(), baseline: number(), threshold: number(), confidence: number()}
  def evaluate(%{observed: observed, baseline: baseline, threshold: threshold, confidence: confidence}) when threshold >= 0 and confidence >= 0 and confidence <= 1 do
    score = abs(observed - baseline) * confidence
    %{score: score, triggered: score >= threshold, reason: if(score >= threshold, do: :threshold_exceeded, else: :within_range)}
  end
  def evaluate(_), do: {:error, :invalid_input}
end
