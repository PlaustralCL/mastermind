# frozen_string_literal: true

require_relative "../mastermind"

module MasterMind
  # Do the initial set up for the game, such as assigning roles
  class SetUp
    attr_reader :code_maker, :code_breaker, :code

    def initialize
      @code_maker = ComputerPlayer.new
      @code_breaker = HumanPlayer.new
      @code = [1, 2, 3, 4]
    end

    def set_up_game
      welcome
      choose_role
      @code = code_maker.make_code
      game = Game.new(rounds: 12, code_breaker: code_breaker, code_maker: code_maker)
      game.play
    end

    def play_again?
      print "Do you want to play again? (y/N) "
      choice = gets.chomp.downcase
      choice == "y"
    end

    def welcome
      intro = <<~HEREDOC
        Welcome to Master Mind!
        You will be the code breaker, breaking the code created by the computer
        After each guess you will be provided clues:
        X = Right number in the right position
        O = Right number in the wrong position
        You have 12 attempts to break the code.
      HEREDOC
  
      puts intro
      puts ""
    end

    private

    def choose_role
      print "Do you want to be the (1) Code Breaker or (2) Code Maker? Please enter 1 or 2: "
      role_choice = gets.chomp.to_i
      case role_choice
      when 2
        selected_code_maker
      else
        selected_code_breaker
      end
    end

    def selected_code_maker
      puts "You have choosen to be the Code Maker\n\n"
      @code_breaker = MasterMind::ComputerPlayer.new
      @code_maker = MasterMind::HumanPlayer.new
    end

    def selected_code_breaker
      puts "You have choosen to be the Code Breaker\n\n"
      @code_breaker = MasterMind::HumanPlayer.new
      @code_maker = MasterMind::ComputerPlayer.new
    end


  end
end