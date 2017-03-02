require 'minitest/autorun'
require_relative 'launch_console_game.rb'

class TestLaunchConsoleGame < Minitest::Test

	def test_player_input_returns_human_vs_human
		assert_equal(Human, get_players(1))	
	end

end