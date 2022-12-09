defmodule Day08Test do
  use ExUnit.Case
  doctest Day08

  def file(), do: File.read!("./input")

  def sanitize(input) do
    input
    |> String.split("\n")
    |> Enum.map(fn str -> str |> String.trim() end)
    |> Enum.map(fn str ->
      str
      |> String.split("")
      |> Enum.reject(fn str -> str == "" end)
      |> Enum.map(&String.to_integer(&1))
    end)
    |> Enum.reject(&Enum.empty?(&1))
  end

  test "count_visible/1" do
    assert file() |> sanitize() |> Day08.count_visible() == 1698
  end

  test "calculate_scenic_score/1" do
    {_coordinates, score} = file() |> sanitize() |> Day08.calculate_scenic_score()
    assert score == 672_280
  end
end
