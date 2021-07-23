# frozen_string_literal: true

require_relative "./secret_code"

module MasterMind
  # Behavior and state for the computer player: guesses and codes
  class ComputerPlayer
    attr_reader :code

    def initialize(code = SecretCode.new.value)
      @code = code
    end
  end
end
