# frozen_string_literal: true

require 'spec_helper'

describe Crane do
  # example stacks
  #     [D]
  # [N] [C]
  # [Z] [M] [P]
  #  1   2   3
  #
  # move 1 from 2 to 1
  # move 3 from 1 to 3
  # move 2 from 2 to 1
  # move 1 from 1 to 2

  describe '.move' do
    subject(:crane) { described_class.move(stacks:, instructions:) }

    let(:stacks) do
      %w[
        ZN
        MCD
        P
      ]
    end

    let(:instructions) do
      [
        { move: 1, from: 2, to: 1 },
        { move: 3, from: 1, to: 3 },
        { move: 2, from: 2, to: 1 },
        { move: 1, from: 1, to: 2 }
      ]
    end

    context 'when asking for the final configuration' do
      subject(:top_crates) { crane.stacks.map { |stack| stack.split('').last } }

      it { is_expected.to eql %w[C M Z] }
    end

    context 'when asking for the puzzle solution on Part 1' do
      subject(:top_crates) { crane.stacks.map { |stack| stack.split('').last } }

      let(:stacks) do
        %w[GFVHPS GJFBVDZM GMLJN NGZVDWP VRCB VRSMPWLZ THP QRSNCHZV FLGPVQJ]
      end

      let(:instructions) do
        # look away kids
        File.read('./input').split("\n").map do |line|
          line.split(' ')
        end.map { |line| { move: line[1].to_i, from: line[3].to_i, to: line[5].to_i } }
      end

      it { is_expected.to eql ["F", "C", "V", "R", "L", "M", "V", "Q", "P"] }
    end
  end
end
