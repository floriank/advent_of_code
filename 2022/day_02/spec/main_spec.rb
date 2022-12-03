# frozen_string_literal: true

require 'spec_helper'

describe RockPaperScissors do
  describe '.score' do
    subject(:score) { described_class.score(rounds) }

    let(:rounds) do
      [
        %w[A Y], # Rock - Draw 4
        %w[B X], # Paper - Loss 1
        %w[C Z] # Scissors - Win 7
      ]
    end

    it { is_expected.to eql 12 }

    context 'when the strategy is different' do
      let(:rounds) do
        [
          %w[A Y], # Rock - Draw 4
          %w[B X], # Paper - Loss 1
          %w[C Z], # Scissors - Win 7
          %w[A Z] # Rock - Win 8
        ]
      end

      it { is_expected.to eql 20 }
    end
  end
end
