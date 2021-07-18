# frozen_string_literal: true

require "mastermind/version"

module MasterMind
  # Generates the clues by comparing the guess to the code
  # @key is a [String]
  class Clues
    attr_reader :guess, :code, :key

    # @param [Array] guess - The guess from the human or computer player
    # @param [Array] code - Should be value property of the secretCode object
    def initialize(guess:, code:)
      @guess = [].replace(guess)
      @code = [].replace(code)
      @key = Array.new(4)
    end

    # @return [String] - An alphabetized string with the clues
    def keys
      exact_match
      near_match
      key.compact.sort.join
    end

    private

    def exact_match
      code.each_index do |index|
        if code[index] == guess[index]
          key[index] = "X"
          code[index] = 0
        end
      end
    end

    def near_match
      matches = code.intersection(guess).size
      matches.times { key.push("O") }
    end
  end
end
