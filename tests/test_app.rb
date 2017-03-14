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
	end


end