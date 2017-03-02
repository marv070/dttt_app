# File that will launch the game, and combine all the classes/functions.

require_relative 'console_game.rb'

game.intro

player_1 = Sequential.new('X')
player_2 = Human.new('O')

game = ConsoleGame.new(player_1, player_2)

until game.check_winner || game.board.full_board?
game.change_player
game.get_move
game.update_board
game.display_board
end

if game.check_winner
	puts "#{game.active_player.marker} wins!"
else
	puts "It's a cat's game!"
end

def get_players
	puts """
		Please select player 1 by entering a number below
		1 - Human
		2 - Easy Computer
		3 - Medium Computer
		"""
end