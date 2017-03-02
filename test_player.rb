require 'minitest/autorun'
require_relative 'player.rb'

class TestPlayer < Minitest::Test

	def test_get_player_move
		player = Player.new('X')
		assert_equal(0, player.get_move)
	end

end