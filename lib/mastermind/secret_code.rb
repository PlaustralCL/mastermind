# frozen_string_literal: true

module MasterMind

  # Generates the secret code, stored as an array
  class SecretCode
    attr_reader :value

    def initialize(value = random_code)
      @value = value
    end

    private

    # @return [Array]
    def random_code
      code_length = 4
      available_numbers = 6
      (1..code_length).map { rand(1..available_numbers) }
    end
  end
end
