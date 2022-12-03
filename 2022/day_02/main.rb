require 'pry'
class RockPaperScissors
	attr_reader :rounds

	ROCK = 'A'.freeze
	PAPER = 'B'.freeze
	SCISSORS = 'C'.freeze

	ROCK_COUNTER = 'X'.freeze
	PAPER_COUNTER = 'Y'.freeze
	SCISSORS_COUNTER = 'Z'.freeze

	SCORES = {
		[ROCK, ROCK_COUNTER] => 1,
		[PAPER, PAPER_COUNTER] => 2,
		[SCISSORS, SCISSORS_COUNTER] => 3
	}.freeze

	DRAW_SCORE = 3.freeze
	WIN_SCORE = 6.freeze

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
		total = choice(me)

		if draw?(enemy, me)
			return total + DRAW_SCORE
		end

		if win?(enemy, me)
			return total + WIN_SCORE
		end

		total
	end

	def choice(player)
		_, value = SCORES.find { |keys, _| keys.include? player }
		value
	end

	def draw?(player_one, player_two)
		if [player_one, player_two] == [ROCK, ROCK_COUNTER]
			true
		elsif [player_one, player_two] == [PAPER, PAPER_COUNTER]
			true
		elsif [player_one, player_two] == [SCISSORS, SCISSORS_COUNTER]
			true
		else
			false
		end
	end

	def win?(player_one, player_two)
		if [player_one, player_two] == [ROCK, PAPER_COUNTER]
			true
		elsif [player_one, player_two] == [PAPER, SCISSORS_COUNTER]
			true
		elsif [player_one, player_two] == [SCISSORS, ROCK_COUNTER]
			true
		else
			false
		end
	end
end

input = File.read("./input").split("\n").map { |str| str.split(" ")}

score = RockPaperScissors.score(input)

p score
