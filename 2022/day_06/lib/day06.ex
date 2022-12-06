defmodule Day06 do
  @moduledoc """
  Documentation for `Day06`.
  """

  @doc """
  Finds the message after a message marker

  ## Examples

    iex> Day06.find_start_of_message("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
    19
    iex> Day06.find_start_of_message("bvwbjplbgvbhsrlpgdmjqwftvncz")
    23
    iex> Day06.find_start_of_message("nppdvjthqldpwncqszvftbrmjlhg")
    23
    iex> Day06.find_start_of_message("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")
    29
    iex> Day06.find_start_of_message("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")
    26

  """
  def find_start_of_message(input) do
    input |> String.split("") |> Enum.reject(fn str -> str === "" end) |> find_sequence(14)
  end

  @doc """
  Finds the start of a message by looking for the position at which the message marker is complete

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

  defp find_sequence(list \\ [], len \\ 4, idx \\ 0)

  defp find_sequence(list, len, idx) do
    if list |> Enum.slice(idx, len) |> all_different? do
      idx + len
    else
      find_sequence(list, len, idx + 1)
    end
  end

  defp all_different?(list) do
    list |> MapSet.new() |> MapSet.size() == length(list)
  end
end
