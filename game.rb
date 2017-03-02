require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'sequential.rb'
require_relative 'random.rb'


class Game

	attr_accessor :player_1, :player_2

	def initialize(player_1, player_2)
		@player_1 = player_1
		@player_2 = player_2		
	end

	def display_board(board)
	  puts " #{board[0]} | #{board[1]} | #{board[2]} "
	  puts "-----------"
	  puts " #{board[3]} | #{board[4]} | #{board[5]} "
	  puts "-----------"
	  puts " #{board[6]} | #{board[7]} | #{board[8]} "
	end


end