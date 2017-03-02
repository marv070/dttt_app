class Player

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(move)
		print 'Enter 0-8 to choose your square: '
		move = gets.chomp.to_i
		@move = move
	end
		
end