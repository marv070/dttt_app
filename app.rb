require 'sinatra'
# require_relative 'TODO -CHANGE FROM CONSOLE GAME'
require_relative 'board.rb'
require_relative 'unbeatable.rb'
require_relative 'player_classes.rb'

enable :sessions


class TicTacToe < Sinatra::Base

	get '/' do
		session[:opponent] = params[:opponent]
		erb :welcome, :locals => {opponent: session[:opponent]}

	end

	post '/opponent' do
		
		erb :opponent, :locals => {opponent: session[:opponent]}

	end


end
