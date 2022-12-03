defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "sum_calories/3 with sample data" do
    calories = [
      1000,
      2000,
      3000,
      "",
      4000,
      "",
      5000,
      6000,
      "",
      7000,
      8000,
      9000,
      "",
      10000,
      ""
    ]

    assert Day01.sum_calories(calories) == [
             {6000, 1},
             {4000, 2},
             {11000, 3},
             {24000, 4},
             {10000, 5}
           ]
  end
end
