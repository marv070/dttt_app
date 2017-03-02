require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'sequential.rb'
require_relative 'random.rb'


class ConsoleGame

	attr_accessor :player_1, :player_2, :board


	# Need to add way to keep track of active player
	# Add checks for tie and winner per game flow in my launch_game.rb


	def initialize(player_1, player_2)
		@player_1 = player_1
		@player_2 = player_2	
		@board = Board.new	
	end

	def display_board(board)
	  puts " #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]} "
	  puts "-----------"
	  puts " #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]} "
	  puts "-----------"
	  puts " #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]} "
	end


end