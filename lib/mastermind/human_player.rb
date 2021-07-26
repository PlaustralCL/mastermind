# frozen_string_literal: true

# require "mastermind/version"

module MasterMind
  # Behavior and state for the human player: guesses or codes
  class HumanPlayer
    attr_reader :guess, :code

    def initialize
      @guess = ""
      @code = []
    end

    # @return [Array]
    def make_guess
      receive_guess
      # convert guess to an array
      @guess = guess.to_i.digits.reverse
      @guess
    end

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
        puts "Please enter your guess: "
        @guess = gets.chomp
        return guess if valid_guess?

        puts "That was not a valid guess. Please try again."
      end
    end

    def receive_code
      loop do
        puts "Please enter your code: "
        @code = gets.chomp
        return code if valid_code?

        puts "That was not a valid code. Please try again."
      end
    end

    def valid_guess?
      true if guess =~ /^[1-6]{4}$/
    end

    def valid_code?
      true if code =~ /^[1-6]{4}$/
    end

  end
end
