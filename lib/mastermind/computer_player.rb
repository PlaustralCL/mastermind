# frozen_string_literal: true

require_relative "../mastermind"

module MasterMind
  # Behavior and state for the computer player: guesses and codes
  class ComputerPlayer
    private

    attr_reader :solution_set

    public

    attr_reader :code, :guess

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

    # Develops a guess for the computer. The first guess is pre-defined to
    # simplify the process
    # @param [Array] secret_code - The actual code that is trying to be solved.
    # This is how the computer knows what the clue is.
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
      # Assumes a 4 digit code using only the numbers 1 - 6
      (1111..6666).each do |num|
        @solution_set.push(num)
      end
      solution_set_remove_zeros
    end

    # The method of initially populating solution_set results in unneeded numbers
    # that include 0. Since 0 isn't an allowed digit, any number with a 0 is removed
    # from the solution set.
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

    # Compares clue received from the current guess to each number remaining in
    # the solution set. If the number in solution_set would not result in the
    # same clue as the guess, it is removed from the solution set by replacing
    # that element with nil. The nil elements are then removed by compacting
    # the array.
    # @param [Array] secret_code - The actual code that is trying to be solved.
    # It is used to generate the clue for comparison.
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
      sleep 1
      puts guess.join
    end
  end
end
