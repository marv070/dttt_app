require 'minitest/autorun'
require_relative 'sequential.rb'

class TestSequentialAI < Minitest::Test

	def test_ai_picks_first_pos
		ai = new.Sequential('O')
		assert_equal(0, ai.ai_choice)
	end

end