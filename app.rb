require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader'
require_relative './models/connection'
require_relative './models/buyers'
require_relative './models/t_name'
require_relative './models/t_type'

after do 
	ActiveRecord::Base.connection.close
end

get '/shirts' do
	shirts = Tnames.all()
	erb :index, locals {shirts: shirts}
end

get '/shirt/:id' do
	
end

get '/add_to_cart' do

end