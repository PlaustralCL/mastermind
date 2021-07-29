# frozen_string_literal: true

# require "mastermind/version"

module MasterMind
  # Generates the clues by comparing the guess to the code
  # @key is a [String]
  # The #keys method is what is used to generate the cludes
  class Clues
    private

    attr_reader :guess, :code, :key

    public

    # @param [Array] guess - The guess from the human or computer player
    # @param [Array] code - Should be value property of the secretCode object
    def initialize(guess:, code:)
      @guess = [].replace(guess)
      @code = [].replace(code)
      @key = []
    end

    # @return [String] - An alphabetized string with the clues
    def keys
      exact_match
      near_match
      key.compact.sort.join
    end

    private

    # Compares each element of the code with the corresponding element of the guess.
    # If a match is found the key array is updated, the code element is replaced with 0
    # and the guess element is replaced with 99. The code and guess element replacements
    # are different to avoid false positives when moving on to the near match comparison.
    def exact_match
      code.each_index do |index|
        next unless code[index] == guess[index]

        key.push("X")
        code[index] = 0
        guess[index] = 99
      end
    end

    # Cycle through the guess. This will cycle through the code and the guess
    def near_match
      (0..3).each do |guess_index|
        compare_for_near_match(guess_index)
      end
    end

    # Cycle through the code, comparing it to the guess. Each digit of guess can
    # have only one clue, so the loop breaks as soon as a clue is added to the key array.
    # The code digit (code[code_index]) is replaced with 0 to keep it from being used again.
    # Without this, extra keys get generated
    # @param [Integer] guess_index - index of the guess array to use for comparision to the code
    def compare_for_near_match(guess_index)
      (0..3).each do |code_index|
        next unless guess[guess_index] == code[code_index]

        key.push("O")
        code[code_index] = 0
        break
      end
    end
  end
end
