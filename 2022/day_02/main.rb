# frozen_string_literal: true

class RockPaperScissors
  attr_reader :rounds

  ROCK = 'A'
  PAPER = 'B'
  SCISSORS = 'C'

  LOSS = 'X'
  DRAW = 'Y'
  WIN = 'Z'

  SCORES = {
    ROCK => 1,
    PAPER => 2,
    SCISSORS => 3
  }.freeze

  COUNTER = {
    ROCK => PAPER,
    PAPER => SCISSORS,
    SCISSORS => ROCK
  }.freeze

  DRAW_SCORE = 3
  WIN_SCORE = 6

  def self.score(rounds)
    new(rounds:).score
  end

  def initialize(rounds:)
    @rounds = rounds
  end

  def score
    result = rounds.map do |round|
      enemy, me = round
      calculate_score(enemy, me)
    end

    result.reduce(0, :+)
  end

  private

  def calculate_score(enemy, me)
    total = 0
    return total + choose(enemy) + DRAW_SCORE if should_draw?(me)

    return total + choose_win(enemy) + WIN_SCORE if should_win?(me)

    total + choose(COUNTER.invert[enemy])
  end

  def choice(player)
    _, value = SCORES.find { |keys, _| keys.include? player }
    value
  end

  def should_draw?(signal)
    signal == DRAW
  end

  def should_win?(signal)
    signal == WIN
  end

  def choose(player)
    SCORES[player]
  end

  def choose_win(player)
    SCORES[COUNTER[player]]
  end
end

input = File.read('./input').split("\n").map { |str| str.split(' ') }

score = RockPaperScissors.score(input)
