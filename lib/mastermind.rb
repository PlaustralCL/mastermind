# frozen_string_literal: true


require_relative "mastermind/clues"
require_relative "mastermind/guess"
require_relative "mastermind/secret_code"
require_relative "mastermind/human_player"

module MasterMind
  def self.game
    puts "Welcome to Master Mind!"
    puts "You will be the code breaker, breaking the code created by the computer"
    puts "After each guess you will be provided clues:"
    puts "X = Right number in the right position"
    puts "O = Right number in the wrong position"

    code = SecretCode.new([1, 2, 3, 4]).value
    code_breaker = HumanPlayer.new
    3.times do
      guess = code_breaker.make_guess
      clues = Clues.new(guess: guess, code: code).keys
      puts clues
      puts ""
      if clues == "XXXX"
        puts "You found the code!"
        break
      end
    end

    puts "The code was #{code.join}"
  end

end

MasterMind.game
