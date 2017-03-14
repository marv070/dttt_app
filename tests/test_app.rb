require 'minitest/autorun'
require 'rack/test'
require_relative '../app.rb'

class TestApp < Minitest::Test
	include Rack::Test::Methods

	def app
		TicTacToe
	end

	def test_welcome
		get '/'
		assert(last_response.ok?)
		assert(last_response.body.include?('Welcome to Tic Tac Toe'))
		assert(last_response.body.include?("<option value='human'>Human</option>"))
		assert(last_response.body.include?("<option value='unbeatable'>Impossible!</option>"))
	end


end