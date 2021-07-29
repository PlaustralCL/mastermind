# frozen_string_literal: true

module MasterMind
  # Generates the secret code, stored as an array
  class SecretCode
    attr_reader :value

    # @param [Array] value. Allows an array to be passed upon initialization if
    # a specific code is needed, such as for troubleshooting or testing.
    def initialize(value = random_code)
      @value = value
    end

    private

    # Generates a 4 digit code using the numbers 1 - 6. Each digit of the code
    # is generated separately. Repeated numbers are allowed, but no blank spaces.
    # @return [Array]
    def random_code
      code_length = 4
      available_numbers = 6
      (1..code_length).map { rand(1..available_numbers) }
    end
  end
end
