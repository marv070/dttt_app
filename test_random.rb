require 'minitest/autorun'
require_relative 'random.rb'

class TestRandomAI < Minitest::Test

	def test_random_ai_selects_random_position
		random_ai = Random.new(I'X')
		assert_equal(0 || 1, random_ai.ai_choice(['', '', 'X', 'X', 'X', 'X', 'X', 'X', 'X']))
	end

end