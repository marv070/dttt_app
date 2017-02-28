class Board

	attr_accessor :ttt_board

	def initialize
		@ttt_board = Array.new(9, '')
	end

	def update_position(position, marker)
		ttt_board[position] = marker
	end

	def valid_position?(position)

		if ttt_board[position] == ''
			true
		else
			false
		end
		
	end

	def valid_input?(input)
		
		if input.match(/[xXoO]/)
			true
		else
			false
		end
		
	end

	def full_board?
		if ttt_board.include?('')
			false
		else
			true
		end
	end

	def winner?(marker)
		#placeholder function to check first 3 positions
		index_pos = 0
		count = 0

		3.times do
			if ttt_board[index_pos] == marker
				count += 1
			end
			index_pos += 1	
		end

		if count == 3
			true
		else
			false
		end
		
	end

end