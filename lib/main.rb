# frozen_string_literal: true

require_relative "mastermind/game"
require_relative "mastermind/secret_code"

puts "Welcome to Master Mind!"
puts "You will be the code breaker, breaking the code created by the computer"
puts "After each guess you will be provided clues:"
puts "X = Right number in the right position"
puts "O = Right number in the wrong position"
puts ""

rounds = 3
code = MasterMind::SecretCode.new([1, 2, 3, 4]).value
game = MasterMind::Game.new(code, rounds, MasterMind::HumanPlayer.new)
game.play
puts ""
puts "The secret code was #{code.join}"
