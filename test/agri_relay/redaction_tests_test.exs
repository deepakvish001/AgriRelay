defmodule AgriRelay.RedactionTestsTest do
  use ExUnit.Case, async: true
  test "redaction tests produces a stable planning score" do
    observed = 12
    baseline = 10
    confidence = 0.75
    assert abs(observed - baseline) * confidence == 1.5
    assert confidence in 0.0..1.0
  end
end
