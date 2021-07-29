# frozen_string_literal: true

require_relative "./mastermind"

# This initiates the master mind game
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
