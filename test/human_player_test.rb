# frozen_string_literal: true

require "test_helper"
require_relative "../lib/mastermind/human_player"

# Tests for class HumanPlayer
class HumanPlayerTest < Minitest::Test
  def test_guess
    code_breaker = MasterMind::HumanPlayer.new
    expect = 1234.digits.reverse
    guess = code_breaker.guess
    assert_equal(expect, guess)
  end

end
