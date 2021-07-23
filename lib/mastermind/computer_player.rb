# frozen_string_literal: true

require_relative "./secret_code"

module MasterMind
  # Behavior and state for the computer player: guesses and codes
  class ComputerPlayer
    attr_reader :code

    def initialize
      @code = SecretCode.new([1, 2, 3, 4]).value
    end
  end
end
