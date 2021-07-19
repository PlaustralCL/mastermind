# frozen_string_literal: true

# require "mastermind/version"

module MasterMind
  # Behavior and state for the human player: guesses or codes
  class HumanPlayer
    attr_accessor :guess

    # @return [Array]
    def make_guess
      receive_guess
      @guess.to_i.digits.reverse
    end

    def valid_guess?
      true if @guess =~ /^[1-6]{4}$/
    end

    # Requests guess until a valid guess is received
    def receive_guess
      loop do
        print "Please enter your guess: "
        @guess = gets.chomp
        return @guess if valid_guess?

        puts "That was not a valid guess. Please try again."
      end
    end

  end
end
