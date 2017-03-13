class UnbeatableAI

	attr_accessor :marker

	def initialize(marker)
		@marker = marker	
	end

	def get_move(ttt_board)

		

	end

	def win_block(ttt_board)

		opponent = 'X'

		if marker == 'X'
			opponent = 'O'
		else
			opponent = 'X'
		end

		win_combos = [
			[ttt_board[0], ttt_board[1], ttt_board[2]],
			[ttt_board[3], ttt_board[4], ttt_board[5]],
			[ttt_board[6], ttt_board[7], ttt_board[8]],
			[ttt_board[0], ttt_board[3], ttt_board[6]],
			[ttt_board[1], ttt_board[4], ttt_board[7]],
			[ttt_board[2], ttt_board[5], ttt_board[8]],
			[ttt_board[0], ttt_board[4], ttt_board[8]],
			[ttt_board[2], ttt_board[4], ttt_board[6]]
			
		]

		winners = [
			[0, 1, 2],
			[3, 4, 5],
			[6, 7, 8],
			[0, 3, 6],
			[1, 4, 7],
			[2, 5, 8],
			[0, 4, 8],
			[2, 4, 6]
		]

		move = ' '
		results = ttt_board.index(' ')

		win_combos.each_with_index do |val, pos|
			if val.count(marker) == 2 && val.count(' ') == 1
				move = val.index(' ')
				results = winners[pos][move]
			elsif
				val.count(opponent) == 2 && val.count(' ') == 1
				move = val.index(' ')
				results = winners[pos][move]
			else
				results	
			end
		end
		results
	end

	def check_for_fork(ttt_board)

		fork_combinations = [
							[ttt_board[0],ttt_board[1],ttt_board[2]],
							[ttt_board[3],ttt_board[4],ttt_board[5]],
							[ttt_board[6], ttt_board[7], ttt_board[8]],
							[ttt_board[0], ttt_board[3], ttt_board[6]],
							[ttt_board[1],ttt_board[4], ttt_board[7]],
							[ttt_board[2],ttt_board[5],ttt_board[8]], 
							[ttt_board[0], ttt_board[4], ttt_board[8]],
							[ttt_board[2],ttt_board[4],ttt_board[6]]
							]

		fork_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[4,1,7],[2,5,8],[0,4,8],[2,4,6]]

		fork_spot = []
		i = []
		
		fork_combinations.each_with_index do |forking_line, index|
			if forking_line.count(marker) == 1 && forking_line.count(" ") == 2
				i.push(index)
			end
		end

		i.each do |index|
			fork_spot << fork_positions[index]
		end
		
		fork_spot = fork_spot.flatten.sort

		intersections = []
		fork_spot.each do |spot|
			if ttt_board[spot] == " "
				intersections.push(spot)
			end
		end

		if intersections.detect { |match| intersections.count(match) > 1 } == nil

			move = 10
		
		else
				
			move = intersections.detect { |match| intersections.count(match) > 1 }
		
		end
				
		move
		
	end

	def block_fork(ttt_board)

		opponent = 'X'

		if marker == 'X'
			opponent = 'O'
		else
			opponent = 'X'
		end

		fork_combinations = [
							[ttt_board[0],ttt_board[1],ttt_board[2]],
							[ttt_board[3],ttt_board[4],ttt_board[5]],
							[ttt_board[6], ttt_board[7], ttt_board[8]],
							[ttt_board[0], ttt_board[3], ttt_board[6]],
							[ttt_board[1],ttt_board[4], ttt_board[7]],
							[ttt_board[2],ttt_board[5],ttt_board[8]], 
							[ttt_board[0], ttt_board[4], ttt_board[8]],
							[ttt_board[2],ttt_board[4],ttt_board[6]]
							]

		fork_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[4,1,7],[2,5,8],[0,4,8],[2,4,6]]

		fork_spot = []
		i = []
		
		fork_combinations.each_with_index do |forking_line, index|
			if forking_line.count(opponent) == 1 && forking_line.count(" ") == 2
				i.push(index)
			end
		end

		i.each do |index|
			fork_spot << fork_positions[index]
		end
		
		fork_spot = fork_spot.flatten.sort

		intersections = []
		fork_spot.each do |spot|
			if ttt_board[spot] == " "
				intersections.push(spot)
			end
		end

		# Takes position 3 if the opponent sets up double corner fork on either side
		# This assumes the center tile takes priority after block fork which I'm pretty sure
		# should prevent the other double fork scenarios.
		# Need to change this later to be more flexible.

		if ttt_board == [" ", " ", opponent, " ", marker, " ", opponent, " ", " "]

			move = 3

		elsif ttt_board == [opponent, " ", " ", " ", marker, " ", " ", " ", opponent]

			move = 3

		elsif intersections.detect { |match| intersections.count(match) > 1 } == nil

			move = 10
		
		else
				
			move = intersections.detect { |match| intersections.count(match) > 1 }
		
		end
				
		move

	end

	def take_center(ttt_board)
		if ttt_board[4] == " "
			move = 4
		else
			move = 10
		end
	end

	def opposite_corner(ttt_board)

		# Re-using opponent too much, can probably initialize this.

		opponent = 'X'

		if marker == 'X'
			opponent = 'O'
		else
			opponent = 'X'
		end

		# Simple but works, revisit if time allows.

		if ttt_board[0] == opponent && ttt_board[8] == " "
			move = 8

		elsif ttt_board[2] == opponent && ttt_board[6] == " "
			move = 6

		elsif ttt_board[6] == opponent && ttt_board[2] == " "
			move = 2

		elsif ttt_board[8] == opponent && ttt_board[0] == " "
			move = 0

		else
			move = 10
		end

	end

	def empty_corner(ttt_board)

		corners = [0,2,6,8]
		empty = []

		corners.each do |pos|
			if ttt_board[pos] == ' '
				empty << pos
			end
		end

		if empty.length > 0
			move = empty.shift
		else
			move = 10
		end
		move

	end

	def empty_side(ttt_board)

		sides = [1,3,5,7]
		empty = []

		sides.each do |pos|
			if ttt_board[pos] == ' '
				empty << pos
			end
		end

		if empty.length > 0
			move = empty.shift
		else
			move = 10
		end
		move

	end

end