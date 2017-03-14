require 'sinatra'
# require_relative 'TODO -CHANGE FROM CONSOLE GAME'
require_relative 'board.rb'
require_relative 'unbeatable.rb'
require_relative 'player_classes.rb'

#Required console_game to start, but that isn't going to work
#Need to make new file specifically for use in app, or do the logic in the app.rb


class TicTacToe < Sinatra::Base

	get '/' do

		erb :welcome

	end



end
