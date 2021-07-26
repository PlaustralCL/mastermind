# frozen_string_literal: true

require_relative "./secret_code"

module MasterMind
  # Behavior and state for the computer player: guesses and codes
  class ComputerPlayer
    attr_reader :code, :guess

    def initialize
      @guess = [1, 1, 2, 2]
      @code = []
    end

    def make_code
      @code = SecretCode.new.value
      @code
    end

    def make_guess
      @guess = [1, 1, 2, 2]
    end
  end
end
