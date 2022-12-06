defmodule Day06 do
  @moduledoc """
  Documentation for `Day06`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Day06.find_start_of_packet("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
      7

      iex> Day06.find_start_of_packet("bvwbjplbgvbhsrlpgdmjqwftvncz")
      5

      iex> Day06.find_start_of_packet("nppdvjthqldpwncqszvftbrmjlhg")
      6

      iex> Day06.find_start_of_packet("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")
      10

      iex> Day06.find_start_of_packet("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")
      11

  """
  def find_start_of_packet(input) do
    input
    |> String.split("")
    |> Enum.reject(fn str -> str == "" end)
    |> find_sequence()
  end

  defp find_sequence(list \\ [], idx \\ 0)

  defp find_sequence(list, idx) do
    # char |> IO.inspect()
    # idx |> IO.inspect()
    # memo |> IO.inspect()

    # !Enum.member?(memo, char) |> IO.inspect()
    # memo |> length |> IO.inspect()
    # IO.puts("----")

    if list |> Enum.slice(idx, 4) |> all_different? do
      idx + 4
    else
      # tail |> IO.inspect()
      find_sequence(list, idx + 1)
    end
  end

  defp all_different?(list) do
    list |> MapSet.new() |> MapSet.size() == length(list)
  end
end
