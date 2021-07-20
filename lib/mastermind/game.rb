# frozen_string_literal: true

require_relative "./clues"
require_relative "./guess"
require_relative "./secret_code"
require_relative "./human_player"

module MasterMind
  # Controls the flow of the game, tracking each round
  class Game
    attr_reader :rounds, :code_breaker, :clues, :code

    def initialize(code, rounds, code_breaker)
      @code = code
      @rounds = rounds
      @code_breaker = code_breaker
      @clues = ""
    end

    def play
      rounds.times do
        play_one_round
        break if clues == "XXXX"
      end
      puts game_result
    end

    def play_one_round
      guess = code_breaker.make_guess
      @clues = Clues.new(guess: guess, code: code).keys
      puts "#{clues}\n"
    end

    def game_result
      @clues == "XXXX" ? "You broke the code!\n" : "You lost. Better luck next time.\n"
    end

    def choose_role
      print "Do you want to be the (1) Code Breaker or (2) Code Maker? Enter 1 or 2. "


    end


  end
end
