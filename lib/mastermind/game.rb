# frozen_string_literal: true

require_relative "../mastermind"

module MasterMind
  # Controls the flow of the game, tracking each round
  class Game
    private

    attr_reader :rounds, :code_breaker, :code_maker

    public

    # @param [Integer] rounds - The number of attempts to find the secret code
    # @param [Object] code_breaker - The object (Human or computer player)
    # @param [Object] code_maker - The object (Human or computer player)
    def initialize(rounds:, code_breaker:, code_maker:)
      @rounds = rounds
      @code_breaker = code_breaker
      @code_maker = code_maker
    end

    def play
      rounds.times do |attempt|
        print "Attempt #{attempt + 1}. "
        play_one_round
        break if new_clue == "XXXX"
      end
      puts game_result
    end

    private

    def play_one_round
      secret_code = code_maker.code
      code_breaker.make_guess(secret_code)
      # Show the new keys after the guess has been made
      puts "#{new_clue}\n\n"
    end

    def game_result
      new_clue == "XXXX" ? win_message : lost_message
    end

    def new_clue
      Clues.new(guess: code_breaker.guess, code: code_maker.code).keys
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
