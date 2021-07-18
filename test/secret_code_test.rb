# frozen_string_literal: true

require "test_helper"
require_relative "../lib/mastermind/secret_code"

# Tests for class SecretCode
class SecretCodeTest < Minitest::Test
  def test_secret_code_initializes
    code = MasterMind::SecretCode.new(1234)
    assert_equal(1234, code.value)
  end

  def test_secret_code_generates_4_digits
    code = MasterMind::SecretCode.new
    assert_equal(4, code.value.size)
  end

  def test_secret_code_is_between_1111_and_6666
    code = MasterMind::SecretCode.new
    assert_includes((1111..6666), code.value.join.to_i)
  end

  def test_secret_code_is_array
    code = MasterMind::SecretCode.new
    assert_kind_of(Array, code.value)
  end
end
