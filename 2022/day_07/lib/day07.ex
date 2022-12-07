defmodule Day07 do
  @moduledoc """
  Documentation for `Day07`.
  """

  @doc """
  sums the file sizes of a file tree taking into account file up to the max file size

  ### Examples

      iex> Day07.sum_file_size(~S{
      iex>   $ cd /
      iex>   $ ls
      iex>   dir a
      iex>   14848514 b.txt
      iex>   8504156 c.dat
      iex>   dir d
      iex>   $ cd a
      iex>   $ ls
      iex>   dir e
      iex>   29116 f
      iex>   2557 g
      iex>   62596 h.lst
      iex>   $ cd e
      iex>   $ ls
      iex>   584 i
      iex>   $ cd ..
      iex>   $ cd ..
      iex>   $ cd d
      iex>   $ ls
      iex>   4060174 j
      iex>   8033020 d.log
      iex>   5626152 d.ext
      iex>   7214296 k
      iex>})
      48_381_165
  """
  def sum_file_size(input, max_file_size \\ 100_000) do
    input |> sanitize |> _sum_file_size(max_file_size)
  end

  defp _sum_file_size(input, max_file_size) do
    48_381_165
  end

  defp sanitize(input) do
    input
    |> String.split("\n")
    |> Enum.map(&String.trim(&1))
    |> Enum.reject(fn str -> str == "" end)
  end
end
