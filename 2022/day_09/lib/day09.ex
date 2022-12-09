defmodule Day09 do
  @moduledoc """
  Documentation for `Day08`.
  """

  @doc """
  simulates rope movements to find the tail's position count

  ### Examples

    iex> Day09.count_tail_positions([
    iex>   {"R", 4},
    iex>   {"U", 4},
    iex>   {"L", 3},
    iex>   {"D", 1},
    iex>   {"R", 4},
    iex>   {"D", 1},
    iex>   {"L", 5},
    iex>   {"R", 2}
    iex> ], {0,0})
    13
  """
  def count_tail_positions(directions, {_x, _y} = heads \\ {0, 0}) do
    directions
    |> Enum.reduce({heads, heads}, fn {direction, amount}, {head, tail} ->
      {head |> step(direction, amount), tail}
    end)
  end

  defp step({x, y}, direction, amount) do
    case direction do
      "U" ->
        {x, y + amount}

      "R" ->
        {x + amount, y}

      "D" ->
        {x, y - amount}

      "L" ->
        {x - amount, y}
    end
  end
end
