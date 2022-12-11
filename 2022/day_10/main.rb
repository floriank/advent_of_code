# frozen_string_literal: true

class CPU
  attr_reader :register, :sum, :current_cycle

  CYCLES = [20, 60, 100, 140, 180, 220].freeze

  def initialize(register: 1)
    @register = register
    @current_cycle = 1
    @sum = 0

    @waiting_value_add = 0
    @wait = -1
  end

  def next_cycle!
    if CYCLES.include?(@current_cycle)
      @sum += @register * @current_cycle
    end

    @current_cycle += 1
    @wait -= 1

    @register += @waiting_value_add if @wait.zero?
  end

  def run(command, value)
    case command
    when 'addx'
      @wait = 2
      @waiting_value_add = value
    when 'noop'
    else
      raise 'unknown command!'
    end
  end

  def waiting?
    @wait.positive?
  end
end
