# frozen_string_literal: true


require_relative "./mastermind/clues"
require_relative "./mastermind/computer_player"
require_relative "./mastermind/game"
require_relative "./mastermind/human_player"
require_relative "./mastermind/secret_code"
require_relative "./mastermind/set_up"

module MasterMind

  def self.new_game
    welcome
  end

  def self.welcome
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

end
