# File that will launch the game, and combine all the classes/functions.

require 'game.rb'

#User input will go here to determine player 1 and 2

user_input = player_1
user_input2 = player_2

# Initializes a new game with player 1 and 2 selected.
Game.new(player_2, player_2)

# Game flow will go here.
# Need to start game
# Display board
# Get a move from active player
# Update board via board.update_position
# Check for winner or tie
# Change players and repeat