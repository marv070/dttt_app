# File that will launch the game, and combine all the classes/functions.

require_relative 'console_game.rb'

player_1 = Sequential.new('X')
player_2 = Random.new('O')

# get_player1
# get_player2

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