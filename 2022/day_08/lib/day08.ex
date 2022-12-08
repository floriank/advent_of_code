defmodule Day08 do
  @moduledoc """
  Documentation for `Day08`.
  """

  @doc """
  counts the visible trees in a given list of lists

  ### Examples

      iex> Day08.count_visible([
      iex>   [3,0,3,7,3],
      iex>   [2,5,5,1,2],
      iex>   [6,5,3,3,2],
      iex>   [3,3,5,4,9],
      iex>   [3,5,3,9,0]
      iex> ])
      21

      iex> Day08.count_visible([[1,1,1,2,3]])
      5

      iex> Day08.count_visible([
      iex>   [1,1,1],
      iex>   [1,1,1],
      iex> ])
      6

      iex> Day08.count_visible([
      iex>   [1,1,1],
      iex>   [1,6,1],
      iex>   [1,1,1],
      iex> ])
      9

      iex> Day08.count_visible([
      iex>   [1,8,1],
      iex>   [6,6,8],
      iex>   [1,7,1],
      iex>   [1,1,1],
      iex> ])
      11

      iex> Day08.count_visible([
      iex>   [1,8,1,1],
      iex>   [6,6,8,1],
      iex>   [1,7,1,1],
      iex>   [1,1,1,1],
      iex> ])
      14

      iex> Day08.count_visible([
      iex>   [1,1,1,1,1],
      iex>   [1,6,1,1,1],
      iex>   [1,1,3,2,1],
      iex>   [1,1,2,2,2],
      iex>   [1,1,1,2,1],
      iex> ])
      20

      iex> Day08.count_visible([
      iex>   [3,0,3,7,3],
      iex>   [2,5,1,1,2],
      iex>   [6,5,3,3,2],
      iex>   [3,3,5,4,9],
      iex>   [3,5,3,9,0]
      iex> ])
      20


  """
  def count_visible(trees) do
    trees
    |> Enum.with_index()
    |> Enum.reduce(0, fn {tree_line, row}, outer ->
      cond do
        # top row, done
        row == 0 ->
          outer + length(tree_line)

        # bottom row, done
        row == length(trees) - 1 ->
          outer + length(tree_line)

        true ->
          tree_line
          |> Enum.with_index()
          |> Enum.reduce(outer, fn {height, col}, inner ->
            cond do
              # start or end of tree line
              col == 0 || col == length(tree_line) - 1 ->
                inner + 1

              # visible from the top
              height |> visible?(:top, row, col, tree_line, trees) ->
                # {{row, col}, height, :top} |> IO.inspect()
                inner + 1

              # visible from the right
              height |> visible?(:right, row, col, tree_line, trees) ->
                # {{row, col}, height, :right} |> IO.inspect()
                inner + 1

              # visible from the bottom
              height |> visible?(:bottom, row, col, tree_line, trees) ->
                # {{row, col}, height, :bottom} |> IO.inspect()
                inner + 1

              # visible from the left
              height |> visible?(:left, row, col, tree_line, trees) ->
                # {{row, col}, height, :left} |> IO.inspect()
                inner + 1

              true ->
                # {{row, col}, height, :none} |> IO.inspect()
                inner
            end
          end)
      end
    end)
  end

  defp column(trees, idx) do
    trees |> Enum.map(&Enum.at(&1, idx))
  end

  defp visible?(height, :top, _row, col, _line, trees) do
    height > trees |> column(col) |> Enum.slice(0..col) |> Enum.max()
  end

  defp visible?(height, :right, _row, col, line, _trees) do
    height > Enum.slice(line, (col + 1)..(length(line) - 1)) |> Enum.max()
  end

  defp visible?(height, :bottom, row, col, _line, trees) do
    height > trees |> column(col) |> Enum.slice((row + 1)..(length(trees) - 1)) |> Enum.max()
  end

  defp visible?(height, :left, _row, col, line, _trees) do
    height > Enum.slice(line, 0..(col - 1)) |> Enum.max()
  end

  defp visible?(_, _, _, _, _, _), do: false
end
