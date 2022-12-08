defmodule Day08Test do
  use ExUnit.Case
  doctest Day08

  def file() do
    {:ok, file} = File.read("./input")
    file
  end

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
end
