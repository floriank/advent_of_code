defmodule Day01 do
  @moduledoc """
  Documentation for `Day01`.
  """

  def order_by_highest(list) do
    list
    |> Enum.sort_by(fn {calories, _position} -> calories end, :desc)
  end

  @doc """
  sums up the elves calorie list
  """
  def sum_calories(list \\ [], current \\ {0, 1}, sum \\ [])

  def sum_calories([_item = "" | leftover], {_current, position} = elf, sum) do
    [elf | sum_calories(leftover, {0, position + 1}, sum)]
  end

  def sum_calories([calorie | leftover], {current, position} = _elf, sum) do
    sum_calories(leftover, {current + calorie, position}, sum)
  end

  def sum_calories(_, _, sum), do: sum
end
