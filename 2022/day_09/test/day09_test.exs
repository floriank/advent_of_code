defmodule Day09Test do
  use ExUnit.Case
  doctest Day09

  def file(), do: File.read!("./input")

  def sanitize(input) do
    input
    |> String.split()
    |> Enum.chunk_every(2)
    |> Enum.map(&Enum.into(&1, []))
    |> Enum.map(fn [direction, tiles] ->
      {direction, tiles |> String.to_integer()}
    end)
  end

  test "simulate/2" do
    assert file() |> sanitize |> Day09.simulate({0, 0}) |> Enum.count() == 6090
  end

  test "simulate_long/3" do
    assert file() |> sanitize |> Day09.simulate_long({0, 0}, 10) |> Enum.count() == 2566
  end
end
