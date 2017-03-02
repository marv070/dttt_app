require 'minitest/autorun'
require_relative 'game.rb'

class TestGame < Minitest::Test

	def test_players
		player_1 = Sequential.new('X')
		player_2 = Random.new('O')
		game = Game.new(player_1, player_2)
		assert_equal('X', game.player_1.marker)
		
	end

end