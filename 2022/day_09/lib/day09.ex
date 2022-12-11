defmodule Day09 do
  @moduledoc """
  Documentation for `Day08`.
  """

  @doc """
  simulates rope movements to find the tail's position count

  ### Examples

    # iex> Day09.simulate([{"R", 4}]) |> Enum.count()
    # 4

    iex> Day09.simulate([
    iex>   {"R", 4},
    iex>   {"U", 4},
    iex>   {"L", 3},
    iex>   {"D", 1},
    iex>   {"R", 4},
    iex>   {"D", 1},
    iex>   {"L", 5},
    iex>   {"R", 2}
    iex> ]) |> Enum.count()
    13
  """
  def simulate(directions, {_x, _y} = head \\ {0, 0}) do
    directions
    |> Enum.reduce([head], fn {direction, amount}, heads ->
      # calculate all positions for the head
      1..amount
      |> Enum.reduce(heads, fn _, [position | _] = positions ->
        [position |> step(direction, 1) | positions]
      end)
    end)
    |> Enum.reverse()
    |> Enum.reduce([{0, 0}], fn {_x, _y} = head, [tail | _] = tails ->
      # follow all head positions with the tail and add them to a set
      [tail |> follow(head) | tails]
    end)
    |> Enum.uniq()
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

  defp follow(pos, pos), do: pos

  defp follow({a, b} = tail, {x, y} = _head) do
    case {x - a, y - b} do
      # 1 up
      {0, 1} ->
        tail

      # 1 right
      {1, 0} ->
        tail

      # 2 right
      {2, 0} ->
        {a + 1, b}

      # 1 right, 1 up
      {1, 1} ->
        tail

      # 1 left, 1 up
      {-1, 1} ->
        tail

      # 1 left
      {-1, 0} ->
        tail

      # 1 right, 1 down
      {1, -1} ->
        tail

      # 2 right, 1 up
      {2, 1} ->
        {a + 1, b + 1}

      # 1 up, 2 right
      {1, 2} ->
        {a + 1, b + 1}

      # 2 right, 1 down
      {2, -1} ->
        {a + 1, b - 1}

      # 1 right, 2 down
      {1, -2} ->
        {a + 1, b - 1}

      # 1 down
      {0, -1} ->
        tail

      # 1 left, 1 down
      {-1, -1} ->
        tail

      # 2 down
      {0, -2} ->
        {a, b - 1}

      # 1 left, 2 down
      {-1, -2} ->
        {a - 1, b - 1}

      # 2 left, 1 down
      {-2, -1} ->
        {a - 1, b - 1}

      # 2 left
      {-2, 0} ->
        {a - 1, b}

      # 2 left, 1 up
      {-2, 1} ->
        {a - 1, b + 1}

      # 1 left, 2 up
      {-1, 2} ->
        {a - 1, b + 1}

      # 2 up
      {0, 2} ->
        {a, b + 1}

      # 2 up, 2 right
      {2, 2} ->
        {a + 1, b + 1}

      # 2 down, 2 left
      {-2, -2} ->
        {a - 1, b - 1}

      # 2 left, 2 up
      {-2, 2} ->
        {a - 1, b + 1}

      # 2 right, 2 down
      {2, -2} ->
        {a + 1, b - 1}
    end
  end
end
