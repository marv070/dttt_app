require 'minitest/autorun'
require_relative 'unbeatable.rb'

class TestUnbeatableAI < Minitest::Test

	def test_marker
		newAI = UnbeatableAI.new('X')
		assert_equal('X', newAI.marker)		
	end

	def test_go_for_win
		newAI = UnbeatableAI.new('X')
		assert_equal(2, newAI.get_move(['X', 'X', ' ', ' ', ' ', ' ', ' ', ' ', ' ']))
	end

	def test_go_for_win_345
		newAI = UnbeatableAI.new('X')
		assert_equal(4, newAI.get_move([' ', ' ', ' ', 'X', ' ', 'X', ' ', ' ', ' ']))
	end

	def test_go_for_win_678
		newAI = UnbeatableAI.new('X')
		assert_equal(8, newAI.get_move([' ', ' ', ' ', ' ', ' ', ' ', 'X', 'X', ' ']))
	end

	def test_go_for_win_246
		newAI = UnbeatableAI.new('X')
		assert_equal(6, newAI.get_move([' ', ' ', 'X', ' ', 'X', ' ', ' ', ' ', ' ']))
	end

	def test_go_for_win_246_O
		newAI = UnbeatableAI.new('O')
		assert_equal(6, newAI.get_move([' ', ' ', 'O', ' ', 'O', ' ', ' ', ' ', ' ']))
	end

	def test_go_for_win_678_O
		newAI = UnbeatableAI.new('O')
		assert_equal(8, newAI.get_move([' ', ' ', ' ', ' ', ' ', ' ', 'O', 'O', ' ']))
	end

	#BLOCK TESTS

	def test_for_block_O_win
		newAI = UnbeatableAI.new('X')
		assert_equal(1, newAI.get_move(['O', ' ', 'O', 'X', ' ', ' ', ' ', ' ', ' ']))	
	end

	def test_for_block_O_win_345
		newAI = UnbeatableAI.new('X')
		assert_equal(4, newAI.get_move([' ', ' ', 'X', 'O', ' ', 'O', ' ', ' ', ' ']))	
	end

	def test_for_block_O_win_678
		newAI = UnbeatableAI.new('X')
		assert_equal(7, newAI.get_move([' ', ' ', 'X', ' ', ' ', ' ', 'O', ' ', 'O']))	
	end

	def test_for_block_X_win_678
		newAI = UnbeatableAI.new('O')
		assert_equal(7, newAI.get_move([' ', ' ', 'O', ' ', ' ', ' ', 'X', ' ', 'X']))	
	end

	def test_for_block_X_win_246
		newAI = UnbeatableAI.new('O')
		assert_equal(6, newAI.get_move(['X', ' ', 'X', ' ', 'X', 'O', ' ', 'X', 'O']))	
	end

	def test_no_block_no_win
		newAI = UnbeatableAI.new('O')
		assert_equal(1, newAI.get_move(['X', ' ', ' ', ' ', ' ', 'O', ' ', ' ', ' ']))	
	end

	# FORK TESTS

	def test_X_takes_fork
		newAI = UnbeatableAI.new('X')
		assert_equal(true, [4, 8].include?(newAI.check_for_fork(['X', 'O', ' ', 'O', ' ', ' ', 'X', ' ', ' '])))	
	end

end