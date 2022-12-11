# frozen_string_literal: true

require 'rspec'
require 'pry'

describe CPU do
  subject(:cpu) { described_class.new }
  let(:input) do
    ''"
    addx 15
    addx -11
    addx 6
    addx -3
    addx 5
    addx -1
    addx -8
    addx 13
    addx 4
    noop
    addx -1
    addx 5
    addx -1
    addx 5
    addx -1
    addx 5
    addx -1
    addx 5
    addx -1
    addx -35
    addx 1
    addx 24
    addx -19
    addx 1
    addx 16
    addx -11
    noop
    noop
    addx 21
    addx -15
    noop
    noop
    addx -3
    addx 9
    addx 1
    addx -3
    addx 8
    addx 1
    addx 5
    noop
    noop
    noop
    noop
    noop
    addx -36
    noop
    addx 1
    addx 7
    noop
    noop
    noop
    addx 2
    addx 6
    noop
    noop
    noop
    noop
    noop
    addx 1
    noop
    noop
    addx 7
    addx 1
    noop
    addx -13
    addx 13
    addx 7
    noop
    addx 1
    addx -33
    noop
    noop
    noop
    addx 2
    noop
    noop
    noop
    addx 8
    noop
    addx -1
    addx 2
    addx 1
    noop
    addx 17
    addx -9
    addx 1
    addx 1
    addx -3
    addx 11
    noop
    noop
    addx 1
    noop
    addx 1
    noop
    noop
    addx -13
    addx -19
    addx 1
    addx 3
    addx 26
    addx -30
    addx 12
    addx -1
    addx 3
    addx 1
    noop
    noop
    noop
    addx -9
    addx 18
    addx 1
    addx 2
    noop
    noop
    addx 9
    noop
    noop
    noop
    addx -1
    addx 2
    addx -37
    addx 1
    addx 3
    noop
    addx 15
    addx -21
    addx 22
    addx -6
    addx 1
    noop
    addx 2
    addx 1
    noop
    addx -10
    noop
    noop
    addx 20
    addx 1
    addx 2
    addx 2
    addx -6
    addx -11
    noop
    noop
    noop"''
  end

  before do
    while cpu.waiting? || instructions.any?
      unless cpu.waiting?
        cmd, value = instructions.shift
        cpu.run(cmd, value)
      end
      cpu.render!
      cpu.next_cycle!
    end
  end

  let(:instructions) do
    input.split("\n").reject { |s| s == '' }.map do |line|
      command, value = line.strip.split(' ')

      [command, value.to_i]
    end
  end

  describe 'Part 1' do
    describe '.sum' do
      subject(:sum) { cpu.sum }

      it { is_expected.to eql(13_140) }

      context 'when using the input instructions' do
        let(:input) { File.read('./input') }

        it { is_expected.to eql 11820 }
      end
    end
  end

  describe 'Part 2' do
    describe '.display' do
      subject(:display) { cpu.display }

      let(:input) { File.read('./input') }

      it { is_expected.to be_an Array }
    end
  end
end
