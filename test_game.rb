require 'minitest/autorun'
require_relative 'game.rb'

class TestGame < Minitest::Test

	def test_players
		p1 = Sequential.new('X')
		p2 = Random.new('O')
		game = Game.new(p1, p2)
		assert_equal('X', game.p1.marker)
		
	end

end