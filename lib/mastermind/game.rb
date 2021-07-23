# frozen_string_literal: true

require_relative "./clues"
require_relative "./guess"
require_relative "./secret_code"
require_relative "./human_player"

module MasterMind
  # Controls the flow of the game, tracking each round
  class Game
    attr_reader :rounds, :code_breaker, :code_maker

    # @param [Integer] rounds - The number of attempts to find the secret code
    # @param [Object] code_breaker - The object (Human or computer player)
    # @param [Object] code_maker - The object (Human or computer player)
    def initialize(rounds:, code_breaker:, code_maker:)
      @rounds = rounds
      @code_breaker = code_breaker
      @code_maker = code_maker
    end

    def play
      rounds.times do
        play_one_round
        break if Clues.new(guess: code_breaker.guess, code: code_maker.code).keys == "XXXX"
      end
      puts game_result
    end

    def play_one_round
      code_breaker.make_guess
      puts "#{Clues.new(guess: code_breaker.guess, code: code_maker.code).keys}\n\n"
    end

    def game_result
      Clues.new(guess: code_breaker.guess, code: code_maker.code).keys == "XXXX" ? win_message : lost_message
    end

    def choose_role
      print "Do you want to be the (1) Code Breaker or (2) Code Maker? Enter 1 or 2. "
    end

    def win_message
      "You broke the code!\n"
    end

    def lost_message
      "You lost. Better luck next time.\n"
    end

  end
end
