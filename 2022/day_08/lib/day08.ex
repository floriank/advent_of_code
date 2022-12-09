[
  defmodule Day08 do
    @moduledoc """
    Documentation for `Day08`.
    """

    @doc """
    ### Examples

        iex> Day08.calculate_scenic_score([
        iex>   [3,0,3,7,3],
        iex>   [2,5,5,1,2],
        iex>   [6,5,3,3,2],
        iex>   [3,3,5,4,9],
        iex>   [3,5,3,9,0]
        iex> ])
        {{3,2}, 8}

    """
    def calculate_scenic_score(trees) do
      trees
      |> Enum.with_index()
      |> Enum.reduce([], fn {tree_line, row}, outer ->
        # IO.inspect({row, col})
        # {{row, col}, top, bottom, left, right, [score: top * bottom * left * right]}
        # |> IO.inspect()
        # Map.put(%{ {row, col}, top * bottom * left * right)
        tree_line
        |> Enum.with_index()
        |> Enum.reduce([], fn {tree, col}, inner ->
          top =
            trees
            |> column(col)
            |> Enum.slice(0..(row - 1))
            |> Enum.reverse()
            |> _scenic_score(tree, 1)

          bottom =
            trees
            |> column(col)
            |> Enum.slice((row + 1)..-1)
            |> _scenic_score(tree, 1)

          left =
            tree_line
            |> Enum.slice(0..(col - 1))
            |> Enum.reverse()
            |> _scenic_score(tree, 1)

          right =
            tree_line
            |> Enum.slice((col + 1)..(length(tree_line) - 1))
            |> _scenic_score(tree, 1)

          [%{coordinates: {row, col}, score: top * bottom * left * right} | inner]
        end)
        |> then(fn inner ->
          [inner | outer]
        end)
      end)
      |> List.flatten()
      |> Enum.reduce({{}, 0}, fn %{coordinates: coords, score: score}, {_, high} = last ->
        if high < score, do: {coords, score}, else: last
      end)
    end

    defp _scenic_score(:done, count), do: count
    defp _scenic_score([], _, count), do: count - 1

    defp _scenic_score([item | rest], tree, count) do
      cond do
        item == tree -> _scenic_score(:done, count)
        item < tree -> _scenic_score(rest, tree, count + 1)
        true -> count
      end
    end

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

                # visible from the bottom
                height |> visible?(:bottom, row, col, tree_line, trees) ->
                  # {{row, col}, height, :bottom} |> IO.inspect()
                  inner + 1

                # visible from the top
                height |> visible?(:top, row, col, tree_line, trees) ->
                  # {{row, col}, height, :top} |> IO.inspect()

                  inner + 1

                # visible from the right
                height |> visible?(:right, col, tree_line, trees) ->
                  # {{row, col}, height, :right} |> IO.inspect()
                  inner + 1

                # visible from the left
                height |> visible?(:left, col, tree_line, trees) ->
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

    defp visible?(height, :bottom, row, col, _line, trees) do
      height > trees |> column(col) |> Enum.slice((row + 1)..-1) |> Enum.max()
    end

    defp visible?(height, :top, row, col, _line, trees) do
      height > trees |> column(col) |> Enum.slice(0..(row - 1)) |> Enum.max()
    end

    defp visible?(height, :right, col, line, _trees) do
      height > Enum.slice(line, (col + 1)..(length(line) - 1)) |> Enum.max()
    end

    defp visible?(height, :left, col, line, _trees) do
      height > Enum.slice(line, 0..(col - 1)) |> Enum.max()
    end
  end
]
