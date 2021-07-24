# frozen_string_literal: true

require_relative "./mastermind/game"
require_relative "./mastermind/computer_player"
require_relative "./mastermind/human_player"

puts "Welcome to Master Mind!"
puts "You will be the code breaker, breaking the code created by the computer"
puts "After each guess you will be provided clues:"
puts "X = Right number in the right position"
puts "O = Right number in the wrong position"
puts ""

rounds = 12
code_maker = MasterMind::ComputerPlayer.new
code_breaker = MasterMind::HumanPlayer.new
game = MasterMind::Game.new(rounds: rounds, code_breaker: code_breaker, code_maker: code_maker)
game.play
puts ""
puts "The secret code was #{code_maker.code.join}"
