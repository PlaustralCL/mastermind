# frozen_string_literal: true

# require "mastermind/version"

module MasterMind
  # Behavior and state for the human player: guesses or codes
  class HumanPlayer
    attr_reader :guess, :code

    def initialize
      @guess = []
      @code = []
    end

    # The * parameter is a placeholder since the computer player version needs
    # be passed the secret code.
    # @return [Array] @guess - The current guesses
    def make_guess(*)
      receive_guess
      # convert guess to an array
      @guess = guess.to_i.digits.reverse
      @guess
    end

    # @return [Array] @code - The secret code
    def make_code
      receive_code
      # convert code to an array
      @code = code.to_i.digits.reverse
      @code
    end

    private

    # Requests guess until a valid guess is received
    # @return [String] @guess
    def receive_guess
      loop do
        puts "Please enter your guess (a 4 digit number using 1-6): "
        @guess = gets.chomp
        return guess if valid_input?(guess)

        puts "That was not a valid guess. Please try again."
      end
    end

    # Loops until a valid code is entered
    def receive_code
      loop do
        enter_code
        return code if valid_input?(code)

        puts "That was not a valid code. Please try again."
      end
    end

    # Prompt for and allow input of secret code
    def enter_code
      puts "Please enter a 4 digit number using 1-6:"
      @code = gets.chomp
      puts ""
    end

    # Checks to see if the guess is 4 digits that using only the numbers 1 - 6
    def valid_input?(input)
      input =~ /^[1-6]{4}$/
    end
  end
end
