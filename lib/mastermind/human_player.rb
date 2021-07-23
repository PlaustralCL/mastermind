# frozen_string_literal: true

# require "mastermind/version"

module MasterMind
  # Behavior and state for the human player: guesses or codes
  class HumanPlayer
    attr_reader :guess

    def initialize
      @guess = ""
    end

    # @return [Array]
    def make_guess
      receive_guess
      # convert guess to an array
      @guess = guess.to_i.digits.reverse
      @guess
    end

    private

    # Requests guess until a valid guess is received
    # @return [String] @guess
    def receive_guess
      loop do
        puts "Please enter your guess: "
        @guess = gets.chomp
        return guess if valid_guess?

        puts "That was not a valid guess. Please try again."
      end
    end

    def valid_guess?
      true if guess =~ /^[1-6]{4}$/
    end

  end
end
