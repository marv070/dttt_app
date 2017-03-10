class UnbeatableAI

	attr_accessor :marker

	def initialize(marker)
		@marker = marker	
	end

	def get_move(ttt_board)

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
		player_index = []
		player_spot = []
		
		fork_combinations.each_with_index do |forking_line, index|
			if forking_line.count(opponent) == 1 && forking_line.count(" ") == 2
				i.push(index)
			end
		end

		# Super repetitive need to refactor later
		# This can be simplified, the only time 2 forks need to be forced on defense
		# is when the opponent has opposite corners and player has the center
		# Need to refactor to take position 3 or 5 when opponent has opposite corners
		# Block fork as normal otherwise
		#----------------------------------------------------------------------------
		fork_combinations.each_with_index do |forking_line, index|
			if forking_line.count(marker) == 1 && forking_line.count(" ") == 2
				player_index.push(index)
			end
		end

		player_index.each do |index|
			player_spot << fork_positions[index]
		end

		#player_spot = player_spot.flatten

		# player_move = 10

		# player_spot.each do |val|
		# 	if ttt_board[val] == marker && ttt_board[val + 1] == " "
		# 		player_move = val
		# 	else
		# 		player_move
		# 	end
		# end


		#----------------------------------------------------------------------------




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

		duplicates = []

		intersections.select do |value|
			if intersections.count(value) > 1 

			duplicates << value
			end
		end

		num_of_forks = duplicates.uniq.length


		#This should defend by making 2 in a row if the opponent can create multiple forks
		#Block the fork if there is only one opportunity
		#Set move to 10 for later logic if there are no opponent fork opportunities
		if num_of_forks > 1
			move = player_move

		elsif num_of_forks ==  1
			move = duplicates[0]

		else num_of_forks == 0
			move = 10
		end
	
		move
		
	end

end