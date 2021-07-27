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

    def make_guess(secret_code)
      if guess == [0, 0, 0, 0]
        first_guess
        return guess
      end
      reduce_solution_set(secret_code)
      update_guess
      guess
    end

    private

    def initial_solution_set
      (1111..6666).each do |num|
        @solution_set.push(num)
      end
      solution_set_remove_zeros
    end

    def solution_set_remove_zeros
      @solution_set = solution_set.map { |num| num.digits.include?(0) ? nil : num }
      @solution_set = solution_set.compact
    end

    def first_guess
      puts "Please enter your guess: "
      @guess = [1, 1, 2, 2]
      sleep 1
      puts guess.join
    end

    def reduce_solution_set(secret_code)
      clue = Clues.new(guess: @guess, code: secret_code).keys
      @solution_set = @solution_set.map do |num|
        Clues.new(guess: num.digits.reverse, code: @guess).keys == clue ? num : nil
      end
      # remove the nil values just added
      @solution_set = @solution_set.compact
    end

    def update_guess
      @guess = @solution_set[0].digits.reverse
      puts "Please enter your guess:"
      # Time delay to allow the player a chance to read the screen
      sleep 1.5
      puts guess.join
    end

  end
end
