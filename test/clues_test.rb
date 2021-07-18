# frozen_string_literal: true

require "test_helper"
require_relative "../lib/mastermind/clues"

# Tests for class Clues
class CluesTest < Minitest::Test
  def test_keys_returns_empty_when_no_matches
    code = 1233.digits.reverse
    guess = 5555.digits.reverse
    clue = MasterMind::Clues.new(guess: guess, code: code)
    assert_equal("", clue.keys)
  end

  def test_keys_returns_all_X_when_correct
    code = 1233.digits.reverse
    guess = 1233.digits.reverse
    clue = MasterMind::Clues.new(guess: guess, code: code)
    expect = "XXXX"
    assert_equal(expect, clue.keys)
  end

  def test_keys_returns_for_one_match
    code = 1233.digits.reverse
    guess = 5155.digits.reverse
    clue = MasterMind::Clues.new(guess: guess, code: code)
    expect = "O"
    assert_equal(expect, clue.keys)
  end

  def test_keys_works_for_duplicate_digits_in_code
    code = 1133.digits.reverse
    guess = 5515.digits.reverse
    clue = MasterMind::Clues.new(guess: guess, code: code)
    expect = "O"
    assert_equal(expect, clue.keys)
  end

  def test_keys_works_for_duplicate_digits_in_guess
    code = 1113.digits.reverse
    guess = 3332.digits.reverse
    clue = MasterMind::Clues.new(guess: guess, code: code)
    expect = "O"
    assert_equal(expect, clue.keys)
  end
end
