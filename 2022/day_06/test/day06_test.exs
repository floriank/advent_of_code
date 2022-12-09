defmodule Day06Test do
  use ExUnit.Case
  doctest Day06

  def file(), do: File.read!("./input")

  test "find_start_of_packet/1" do
    assert file() |> Day06.find_start_of_packet() == 1343
  end

  test "find_start_of_message/1" do
    assert file() |> Day06.find_start_of_message() == 2193
  end
end
