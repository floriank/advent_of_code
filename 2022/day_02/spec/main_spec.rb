require 'spec_helper'


describe RockPaperScissors do
	describe '.score' do
		subject(:score) { described_class.score(rounds) }

		let(:rounds) do
			[
				["A", "Y"], # Rock - Paper 8
				["B", "X"], # Paper - Rock 1
				["C", "Z"], # Scissors - Scissors 6
			]
		end

		it { is_expected.to eql 15 }

		context 'when the strategy is different' do
			let(:rounds) do
				[
					["A", "Y"], # Rock - Paper
					["B", "X"], # Paper - Rock
					["C", "Z"], # Scissors - Scissors
					["A", "Z"], # Rock - Scissors
				]
			end

			it { is_expected.to eql 18 }
		end
	end
end
