# frozen_string_literal: true

require "mastermind/version"

module MasterMind
  # Generates the clues by comparing the guess to the code
  class Clues
    attr_reader :guess, :code, :key

    # @param [Array] guess - The guess from the human or computer player
    # @param [Array] code - Should be value property of the secretCode object
    def initialize(guess:, code:)
      @guess = [].replace(guess)
      @code = [].replace(code)
      @key = Array.new(4)
    end

    def keys
      key = []
      code.each_index do |index|
        if code[index] == guess[index]
          key.push("X")
          code[index] = "-"
        elsif code.uniq.include?(guess[index])
          key.push("O")
          code = "-"
        end

      end


    key.join
  end

end
end
