# File that will launch the game, and combine all the classes/functions.

require_relative 'console_game.rb'

#User input will go here to determine player 1 and 2

player_1 = Sequential.new('X')
player_2 = Human.new('O')

# Initializes a new game with player 1 and 2 selected.
game = ConsoleGame.new(player_1, player_2)

game.intro

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

