# File that will launch the game, and combine all the classes/functions.

require_relative 'console_game.rb'

player_1 = Sequential.new('X')
player_2 = Random.new('O')

def get_players
	puts """
		Please select player 1 by entering a number below
		1 - Human
		2 - Easy Computer
		3 - Medium Computer
		"""
	input1 = gets.chomp.to_i

	puts """
		Please select player 1 by entering a number below
		1 - Human
		2 - Easy Computer
		3 - Medium Computer
		"""
	input2 = gets.chomp.to_i

	case input1
	when 1
		player_1 = Human.new('X')
	when 2
		player_1 = Sequential.new('X')
	when 3
		player_1 = Random.new('X')
	else
		puts "Invalid input, please input 1, 2, or 3"
		get_players
	end

	case input1
	when 1
		player_2 = Human.new('O')
	when 2
		player_2 = Sequential.new('O')
	when 3
		player_2 = Random.new('O')
	else
		puts "Invalid input, please input 1, 2, or 3"
		get_players
	end
end

get_players

# player_1 = Sequential.new('X')
# player_2 = Random.new('O')

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