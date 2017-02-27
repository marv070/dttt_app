require 'minitest/autorun'
require_relative 'board.rb'

class TestBoard < Minitest::Test

	def test_new_board
		board = Board.new
		assert_equal(Array.new(9, ''), board.ttt_board)
	end

	def test_update_first_position
		board = Board.new
		board.update_position(0, 'X')
		assert_equal(['X', '', '', '', '', '', '', '', ''], board.ttt_board)
	end

	def test_first_x_and_second_o
		board = Board.new
		board.update_position(0, 'X')
		board.update_position(1, 'O')
		assert_equal(['X', 'O', '', '', '', '', '', '', ''], board.ttt_board)
	
	end

	def test_update_partial_board_at_last_position
		board = Board.new
		board.ttt_board = ['X', 'O', '', 'X', '', 'O', '', 'X', '']
		board.update_position(8, 'X')
		assert_equal(['X', 'O', '', 'X', '', 'O', '', 'X', 'X'], board.ttt_board)
	end

end