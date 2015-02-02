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
	shirts = Tname.where({current: true})
	erb :index, locals {shirts: shirts}
end

get '/shirt/:id' do

end

get '/add_to_cart' do

end

post '/shirt' do
	shirt = {
		name: params["name"],
		price: params["price"]
	}
	Tname.create(shirt)
	msg = {
		status: "success"
	}
	msg.to_json
end

delete '/shirt/:id' do
	id = params[:id]
	shirts = Ttype.where({tname_id: id})
	shirts.each do |shirt|
		Ttypes.destroy(shirt.id)
	end
	Tname.destroy({id: id})
	msg = {
		status: "success"
	}
	msg.to_json
end	