# File that will launch the game, and combine all the classes/functions.

require_relative 'console_game.rb'

#User input will go here to determine player 1 and 2

player_1 = Sequential.new('X')
player_2 = Random.new('O')

# Initializes a new game with player 1 and 2 selected.
game = ConsoleGame.new(player_1, player_2)

game.intro
game.display_board
game.get_move
game.update_board
game.change_player
game.get_move
game.update_board
game.display_board





# Game flow will go here.
# Need to start game
# Display board
# Get a move from active player
# Update board via board.update_position
# Check for winner or tie
# Change players and repeat