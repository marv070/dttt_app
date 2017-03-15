require 'sinatra'
# require_relative 'TODO -CHANGE FROM CONSOLE GAME'
require_relative 'board.rb'
require_relative 'unbeatable.rb'
require_relative 'player_classes.rb'

enable :sessions


class TicTacToe < Sinatra::Base

	get '/' do
		
		erb :welcome

	end

	post '/get_opponent' do
		session[:opponent] = params[:opponent]
		board = ['X', 'O', ' ', 'X', ' ', 'O', ' ', 'X', 'X']
		
		erb :get_opponent, :locals => {opponent: session[:opponent], board: board}

	end


end
