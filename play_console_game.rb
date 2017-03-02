# File that will launch the game, and combine all the classes/functions.

require_relative 'console_game.rb'

# player_1 = Sequential.new('X')
# player_2 = Random.new('O')

$player_1 = ''
$player_2 = ''

def get_player1
	puts """
		Please select player 1 by entering a number below
		1 - Human
		2 - Easy Computer
		3 - Medium Computer
		"""
	input1 = gets.chomp.to_i

	if input1 == 1
		$player_1 = Human.new('X')

	elsif input1 == 2
		$player_1 = Sequential.new('X')

	elsif input1 == 3
		$player_1 = Random.new('X')

	else
		puts "Invalid input, please input 1, 2, or 3"
		get_player1
	end

end

def get_player2
	puts """
		Please select player 1 by entering a number below
		1 - Human
		2 - Easy Computer
		3 - Medium Computer
		"""
	input2 = gets.chomp.to_i

	if input2 == 1
		$player_2 = Human.new('O')

	elsif input2 == 2
		$player_2 = Sequential.new('O')

	elsif input2 == 3
		$player_2 = Random.new('O')
	else
		puts "Invalid input, please input 1, 2, or 3"
		get_player2
	end
end

get_player1
get_player2

game = ConsoleGame.new($player_1, $player_2)

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