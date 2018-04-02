require_relative "amazonweb.rb"
require 'sinatra'


get '/example1' do
	@term = "example1"
	@items = amazon_search(@term)
	erb :results
end

get '/example2' do
	@term = "example2"
	@items = amazon_search(@term)
	erb :results
end

