class Random

	def initialize(marker)
		@marker = marker
	end

	def ai_choice(board_state)
		valid_pos = []

		board_state.each_with_index do |val, pos|
			if val = ''
				valid_pos.push(pos)
			end
		end
		valid_pos.sample
	end

end