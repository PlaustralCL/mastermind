# frozen_string_literal: true

require_relative "./mastermind/game"
require_relative "./mastermind/computer_player"
require_relative "./mastermind/human_player"

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

def choose_role
  roles = { code_breaker: "", code_maker: "" }
  print "Do you want to be the (1) Code Breaker or (2) Code Maker? Please enter 1 or 2: "
  role_choice = gets.chomp.to_i
  if role_choice == 2
    puts "You have choosen to be the Code Maker\n\n"
    roles[:code_breaker] = MasterMind::ComputerPlayer.new
    roles[:code_maker] = MasterMind::HumanPlayer.new
    return roles
  end
  puts "You have choosen to be the Code Breaker\n\n"
  roles[:code_breaker] = MasterMind::HumanPlayer.new
  roles[:code_maker] = MasterMind::ComputerPlayer.new
  roles
end


rounds = 12
# code_maker = MasterMind::ComputerPlayer.new
# code_breaker = MasterMind::HumanPlayer.new
welcome
roles = choose_role
code_maker = roles[:code_maker]
code_breaker = roles[:code_breaker]
code_maker.make_code
game = MasterMind::Game.new(rounds: rounds, code_breaker: code_breaker, code_maker: code_maker)
game.play
puts ""
puts "The secret code was #{code_maker.code.join}"
