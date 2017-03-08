class UnbeatableAI

	attr_accessor :marker

	def initialize(marker)
		@marker = marker	
	end

	def get_move(ttt_board)

		marker1 = 'X'
		marker2 = 'O'
		opponent = ''

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

end