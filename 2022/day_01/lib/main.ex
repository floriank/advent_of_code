defmodule Main do
  def run do
    {:ok, content} = File.read("./input")

    content
    |> :binary.bin_to_list()
    |> to_string
    |> String.split("\n")
    |> Enum.map(&to_integer/1)
    |> Day01.sum_calories()
    |> Day01.order_by_highest()
    |> Enum.slice(0..2)
    |> Enum.map(fn {x, _} -> x end)
    |> Enum.sum()
  end

  defp to_integer(""), do: ""

  defp to_integer(str_number) do
    {int, _} = Integer.parse(str_number)
    int
  end
end
