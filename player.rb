# new player class
# gets.chomp gets input from the user and assigns it to
# name and marker.  Need to add restrictions later
# so player has to choose x or o.

class Player

	attr_accessor :name, :marker

	def initialize
		print 'Please enter your name: '
		@name = gets.chomp

		print 'Enter X or O to choose your marker: '
		@marker = gets.chomp
	end



end