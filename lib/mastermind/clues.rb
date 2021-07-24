# frozen_string_literal: true

# require "mastermind/version"

module MasterMind
  # Generates the clues by comparing the guess to the code
  # @key is a [String]
  class Clues
    private

    attr_reader :guess, :code, :key

    public

    # @param [Array] guess - The guess from the human or computer player
    # @param [Array] code - Should be value property of the secretCode object
    def initialize(guess:, code:)
      @guess = [].replace(guess)
      @code = [].replace(code)
      @key = Array.new
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
          key.push("X")
          code[index] = 0
          guess[index] = 99
        end
      end
    end

    def near_match
      (0..3).each do |guess_index|
        compare_for_near_match(guess_index)
      end
    end

    def compare_for_near_match(guess_index)
      (0..3).each do |code_index|
        if guess[guess_index] == code[code_index]
          key.push("O")
          code[code_index] = 0
          break
        end
      end
    end

  end
end
