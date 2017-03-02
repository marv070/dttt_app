require 'minitest/autorun'
require_relative 'player.rb'

class TestPlayer < Minitest::Test

	def test_get_player_name
		player = Player.new
		assert_equal('Dan', player.name)
		assert_equal('X', player.marker)
	end

end