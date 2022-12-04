defmodule Day04 do
  @moduledoc """
  Documentation for `Day04`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day04.contained?(["2-4", "6-8"])
      false

      iex> Day04.contained?(["6-6", "4-6"])
      true

      iex> Day04.contained?([])
      false

      iex> Day04.contained?(["5-6", "5-5"])
      true

  """

  def contained?([]), do: false

  def contained?([_, _] = shelves) do
    shelves
    |> Enum.map(fn str -> str |> String.split("-") end)
    |> Enum.map(&to_int/1)
    |> Enum.reject(&is_eol?/1)
    |> Enum.map(fn [x, y] -> Range.new(x, y) end)
    |> is_overlap?
  end

  def contained?(_), do: false

  def run do
    {:ok, file} = File.read("./input")

    file
    |> :binary.bin_to_list()
    |> to_string
    |> String.split("\n")
    |> Enum.map(&String.split(&1, ","))
  end

  defp to_int([""]), do: :eol

  defp to_int(strings) do
    strings |> Enum.map(&String.to_integer/1)
  end

  defp is_eol?(:eol), do: true
  defp is_eol?(_), do: false

  defp is_contained?([shelf_one, shelf_two] = shelves) do
    shelves
    |> Enum.map(&MapSet.new/1)
    |> then(fn [x, y] = args ->
      MapSet.subset?(x, y) || MapSet.subset?(y, x)
    end)
  end

  defp is_overlap?([shelf_one, shelf_two] = shelves) do
    shelves
    |> Enum.map(&MapSet.new/1)
    |> then(fn [x, y] ->
      MapSet.intersection(x, y) |> MapSet.to_list() |> length() > 0
    end)
  end
end
