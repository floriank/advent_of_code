defmodule Day07Test do
  use ExUnit.Case
  doctest Day07

  def file(), do: File.read!("./input")

  test "sum_file_size/2" do
    assert file() |> Day07.sum_file_size(, 100_000) == 1_723_892
  end

  test "find_smallest_directory_to_delete/3" do
    assert file() |> Day07.find_smallest_directory_to_delete() ==
             {["tjhzggs", "fqldn", "qcf"], 8_474_158}
  end
end
