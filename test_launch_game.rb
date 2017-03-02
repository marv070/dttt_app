require 'minitest/autorun'
require_relative 'launch_console_game.rb'

class TestConsoleGame < Minitest::Test

	def test_human_input
		input = get_players
		assert_equal(1, input)
	end

end