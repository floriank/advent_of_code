require 'rspec'
require 'pry'
describe Rucksack do
	describe '#sort' do
		subject(:sorted) { described_class.sort(input) }

		let(:input) do
			[
				'vJrwpWtwJgWrhcsFMMfFFhFp',
				'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL',
				'PmmdzqPrVvPwwTWBwg',
				'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn',
				'ttgJtRGJQctTZtZT',
				'CrZsJsPPZsGzwwsLwLmpwMDw'
			]
		end

		it { is_expected.to be_an Array }

		it do
			is_expected.to eql [
				{ left: 'vJrwpWtwJgWr', right: 'hcsFMMfFFhFp', common: 'p' },
				{ left: 'jqHRNqRjqzjGDLGL', right: 'rsFMfFZSrLrFZsSL', common: 'L' },
				{ left: 'PmmdzqPrV', right: 'vPwwTWBwg', common: 'P' },
				{ left: 'wMqvLMZHhHMvwLH', right: 'jbvcjnnSBnvTQFn', common: 'v' },
				{ left: 'ttgJtRGJ', right: 'QctTZtZT', common: 't' },
				{ left: 'CrZsJsPPZsGz', right: 'wwsLwLmpwMDw', common: 's' },
			]
		end
	end
end

describe Priority do
	describe '#calcuate' do
		subject(:priority) { described_class.calculate(character) }

		let(:character) { 'p' }

		it { is_expected.to eql 16 }

		context 'when the character is "L"' do
			let(:character) { 'L' }
			it { is_expected.to eql 38 }
		end

		context 'when the character is "P"' do
			let(:character) { 'P' }
			it { is_expected.to eql 42 }
		end

		context 'when the character is "v"' do
			let(:character) { 'v' }
			it { is_expected.to eql 22 }
		end

		context 'when the character is "t"' do
			let(:character) { 't' }
			it { is_expected.to eql 20 }
		end

		context 'when the character is "s"' do
			let(:character) { 's' }
			it { is_expected.to eql 19 }
		end
	end
end

describe BadgeFinder do
	describe '#by_group' do
		subject(:badge) { described_class.by_group(group) }

		let(:group) do
			[
				'vJrwpWtwJgWrhcsFMMfFFhFp',
				'jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL',
				'PmmdzqPrVvPwwTWBwg'
			]
		end

		it { is_expected.to eql 'r' }

		context 'when it is the second group' do
			let(:group) do
				[
					'wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn',
					'ttgJtRGJQctTZtZT',
					'CrZsJsPPZsGzwwsLwLmpwMDw'
				]
			end

			it { is_expected.to eql 'Z' }
		end
	end
end
