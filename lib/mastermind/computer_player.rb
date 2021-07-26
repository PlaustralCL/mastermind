# frozen_string_literal: true

require_relative "./secret_code"

module MasterMind
  # Behavior and state for the computer player: guesses and codes
  class ComputerPlayer
    attr_reader :code, :guess, :solution_set

    def initialize
      @guess = [0, 0, 0, 0]
      @code = []
      @solution_set = []
      initial_solution_set
    end

    def make_code
      @code = SecretCode.new.value
      @code
    end

    def initial_solution_set
      (1111..6666).each do |num|
        @solution_set.push(num)
      end

      @solution_set = solution_set.map { |num| num.digits.include?(0) ? nil : num }
      @solution_set = solution_set.compact
    end

    def first_guess
      puts "Please enter your guess: "
      @guess = [1, 1, 2, 2]
      puts guess.join
    end

    def make_guess(secret_code)
      if guess == [0, 0, 0, 0]
        first_guess
        return guess
      end

      clue = Clues.new(guess: @guess, code: secret_code).keys
      @solution_set = @solution_set.map do |num|
        Clues.new(guess: num.digits.reverse, code: @guess).keys == clue ? num : nil
      end

      # remove the nil values just added
      @solution_set = @solution_set.compact

      # update @guess
      @guess = @solution_set[0].digits.reverse
      puts "Please enter your guess:"
      puts guess.join
      guess
    end

  end
end
