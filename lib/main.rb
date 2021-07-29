# frozen_string_literal: true

require_relative "./mastermind"



# def choose_role
#   roles = { code_breaker: "", code_maker: "" }
#   print "Do you want to be the (1) Code Breaker or (2) Code Maker? Please enter 1 or 2: "
#   role_choice = gets.chomp.to_i
#   if role_choice == 2
#     puts "You have choosen to be the Code Maker\n\n"
#     roles[:code_breaker] = MasterMind::ComputerPlayer.new
#     roles[:code_maker] = MasterMind::HumanPlayer.new
#     return roles
#   end
#   puts "You have choosen to be the Code Breaker\n\n"
#   roles[:code_breaker] = MasterMind::HumanPlayer.new
#   roles[:code_maker] = MasterMind::ComputerPlayer.new
#   roles
# end


# rounds = 12
# MasterMind.new_game
# roles = choose_role
# code_maker = roles[:code_maker]
# code_breaker = roles[:code_breaker]
# code_maker.make_code
# game = MasterMind::Game.new(rounds: rounds, code_breaker: code_breaker, code_maker: code_maker)

loop do
  game = MasterMind::SetUp.new
  game.set_up_game
  # game.play
  puts ""
  puts "The secret code was #{game.code.join}\n\n"
  break unless game.play_again?

  puts ""
end

puts "\nThanks for playing!\n\n"
