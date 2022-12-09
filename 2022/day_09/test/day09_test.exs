defmodule Day09Test do
  use ExUnit.Case
  doctest Day09

  @input "./input"

  def sanitize(input) do
    input
    |> String.split()
    |> Enum.chunk_every(2)
    |> Enum.map(&Enum.into(&1, []))
    |> Enum.map(fn [direction, tiles] ->
      {direction, tiles |> String.to_integer()}
    end)
  end

  test "count_tail_positions/2" do
    # @input |> File.read!() |> sanitize |> Day09.count_tail_positions()
  end
end
