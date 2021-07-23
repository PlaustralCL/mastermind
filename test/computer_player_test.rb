# frozen_string_literal: true

require "test_helper"
require_relative "../lib/mastermind/computer_player"

# Tests for class ComputerPlayer
class ComputerPlayerTest < Minitest::Test
  def test_set_code_manually
    code = MasterMind::ComputerPlayer.new([1, 2, 3, 4])
    assert_equal([1, 2, 3, 4], code.code)
  end

  def test_code_creates_array
    code = MasterMind::ComputerPlayer.new
    assert_kind_of(Array, code.code)
  end

  def test_code_in_proper_range
    code = MasterMind::ComputerPlayer.new
    assert_includes((1111..6666), code.code.join.to_i)
  end

end
