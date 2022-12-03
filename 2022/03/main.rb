# frozen_string_literal: true

class Rucksack
  attr_reader :input

  def self.sort(input)
    new(input:).sort
  end

  def initialize(input:)
    @input = input
  end

  def sort
    input.reduce([]) do |memo, rucksack|
      _head, left, right = rucksack.partition(/.{#{rucksack.size / 2}}/)
      common = left.split('').intersection(right.split('')).pop
      memo << { left:, right:, common: }
    end
  end
end

class Priority
  attr_reader :char

  def self.calculate(char)
    new(char:).calculate
  end

  def initialize(char:)
    @char = char
  end

  def calculate
    position = char.upcase.ord - 'A'.ord + 1

    if char.downcase == char
      position
    else
      position + 26
    end
  end
end

class BadgeFinder
  attr_reader :group

  def self.by_group(group)
    new(group:).find
  end

  def initialize(group:)
    @group = group
  end

  def find
    first, second, third = group.map { |rucksack| rucksack.split('') }

    first.intersection(second).intersection(third).pop
  end
end

rucksacks = File.read('./input').split("\n")

part_one = Rucksack.sort(rucksacks).map do |rucksack|
  rucksack[:common]
end.reduce(0) do |total, char|
  total += Priority.calculate(char)
end

part_two = rucksacks.each_slice(3).map do |group|
  BadgeFinder.by_group group
end.reduce(0) do |total, char|
  total += Priority.calculate(char)
end

p part_two
