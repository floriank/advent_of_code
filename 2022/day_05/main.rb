# frozen_string_literal: true

# input stacks
#     [M]             [Z]     [V]
#     [Z]     [P]     [L]     [Z] [J]
# [S] [D]     [W]     [W]     [H] [Q]
# [P] [V] [N] [D]     [P]     [C] [V]
# [H] [B] [J] [V] [B] [M]     [N] [P]
# [V] [F] [L] [Z] [C] [S] [P] [S] [G]
# [F] [J] [M] [G] [R] [R] [H] [R] [L]
# [G] [G] [G] [N] [V] [V] [T] [Q] [F]
#  1   2   3   4   5   6   7   8   9

class Crane
  attr_reader :stacks, :instructions

  def initialize(stacks:, instructions:)
    @stacks = stacks
    @instructions = instructions
  end

  def self.move(stacks:, instructions:)
    new(stacks:, instructions:).move
  end

  def move
    instructions.each do |instruction|
      move, from, to = instruction.values_at :move, :from, :to

      crates_from = stacks[from - 1]
      crates_to   = stacks[to - 1]
      crates = crates_from[-move..]

      crates.split('').reverse.each do |crate|
        crates_to += crate
        crates_from = crates_from.chomp(crate)
      end
      stacks[to - 1] = crates_to
      stacks[from - 1] = crates_from
    end

    self
  end
end
