require 'minitest/autorun'
require_relative 'sequential.rb'

class TestSequentialAI < Minitest::Test

	def test_ai_picks_first_pos
		ai = Sequential.new('O')
		assert_equal(0, ai.ai_choice(['', '', '', '', '', '', '', '', '']))
	end

	def test_ai_picks_second_pos
		ai = Sequential.new('O')
		assert_equal(1, ai.ai_choice(['X', '', '', '', '', '', '', '', '']))
	end

	def test_ai_picks_third_pos
		ai = Sequential.new('O')
		assert_equal(2, ai.ai_choice(['X', 'X', '', '', '', '', '', '', '']))
	end

	def test_ai_picks_fourth_pos
		ai = Sequential.new('O')
		assert_equal(3, ai.ai_choice(['X', 'X', 'O', '', '', '', '', '', '']))
	end

	def test_ai_picks_fifth_pos
		ai = Sequential.new('O')
		assert_equal(4, ai.ai_choice(['X', 'X', 'd', 'f', '', '', '', '', '']))
	end

	def test_ai_picks_sixth_pos
		ai = Sequential.new('O')
		assert_equal(5, ai.ai_choice(['X', 'X', '4', 'f', 'd', '', '', '', '']))
	end

end