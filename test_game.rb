require 'minitest/autorun'
require_relative 'game.rb'

class TestGame < Minitest::Test

	def test_players
		player_1 = Sequential.new('X')
		player_2 = Random.new('O')
		game = Game.new(player_1, player_2,)
		assert_equal('X', game.player_1.marker)
		assert_equal('O', game.player_2.marker)
	end

	def test_board
		player_1 = Sequential.new('X')
		player_2 = Random.new('O')
		game = Game.new(player_1, player_2,)
		assert_equal(['', '', '', '', '', '', '', '', ''], game.board.ttt_board)
	end

end