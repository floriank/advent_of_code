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
      95437
  """
  def sum_file_size(input, max_file_size \\ 100_000) do
    input |> sanitize |> _to_tree |> _sum_file_size(max_file_size)
  end

  @doc """
  finds the smallest directory to delete given maximum available space and reuired space to free

  ### Examples

      iex> Day07.find_smallest_directory_to_delete(~S{
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
      {["d"], 24933642}
  """
  def find_smallest_directory_to_delete(
        input,
        space_available \\ 70_000_000,
        space_needed \\ 30_000_000
      ) do
    input |> sanitize() |> _to_tree |> _find_smallest_directory(space_available, space_needed)
  end

  defp _find_smallest_directory(tree, space_available, space_needed) do
    directories = tree |> _calculate_directory_size()

    # we need the space still available
    # [[]] is the root
    usage = space_available - directories[[]]
    required = space_needed - usage

    directories
    |> Enum.filter(fn {_, size} -> size >= required end)
    |> Enum.min_by(fn {_, size} -> size end)
  end

  defp _sum_file_size(tree, max_file_size) do
    tree
    |> _calculate_directory_size()
    |> Enum.filter(fn {_dirs, size} -> size <= max_file_size end)
    |> Enum.reduce(0, fn {_dirs, size}, sum -> sum + size end)
  end

  defp _calculate_directory_size(tree) do
    tree
    |> Qex.new()
    |> _sum_sizes(%{})
  end

  defp sanitize(input) do
    input
    |> String.split("\n")
    |> Enum.map(&String.trim(&1))
    |> Enum.reject(fn str -> str == "" end)
  end

  defp _to_tree(commands) do
    commands
    |> Enum.reduce({nil, %{}}, &parse/2)
    |> then(fn {_, map} -> map end)
    |> Enum.to_list()
  end

  defp parse("$ cd /", {_, dirs}), do: {[], dirs}
  defp parse("$ cd ..", {[_ | path], dirs}), do: {path, dirs}
  defp parse(<<"$ cd ", dir::binary>>, {path, dirs}), do: {[dir | path], dirs}
  defp parse(<<"$ ls">>, {path, dirs}), do: {path, Map.put(dirs, path, {[], []})}

  defp parse(<<"dir ", dir::binary>>, {path, dirs}) do
    {path, dirs |> Map.update!(path, fn {dirs, files} -> {[[dir | path] | dirs], files} end)}
  end

  defp parse(file, {path, dirs}) do
    [filesize, name] = file |> String.split()
    {size, _} = filesize |> Integer.parse()
    {path, dirs |> Map.update!(path, fn {dirs, files} -> {dirs, [{size, name} | files]} end)}
  end

  defp _sum_sizes([], _ = output), do: output

  defp _sum_sizes(list, output) do
    if Enum.empty?(list) do
      output
    else
      {dir = {path, {children, files}}, list} = Qex.pop!(list)

      if Enum.all?(children, &Map.has_key?(output, &1)) do
        files = files |> Enum.reduce(0, fn {size, _}, sum -> sum + size end)
        dirs = children |> Enum.reduce(0, fn name, sum -> sum + output[name] end)
        _sum_sizes(list, output |> Map.put(path, dirs + files))
      else
        _sum_sizes(list |> Qex.push(dir), output)
      end
    end
  end
end
