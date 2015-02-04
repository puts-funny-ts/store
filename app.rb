require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader'
require_relative './models/connection'
require_relative './models/buyers'
require_relative './models/purchases'
require_relative './models/t_name'
require_relative './models/t_type'

after do 
	ActiveRecord::Base.connection.close
end

# gets the index page
get '/' do
	shirts = Tname.where({available: true})
	erb :index, locals: {shirts: shirts}
end

# gets the admin page
get '/admin' do
	shirts = Tname.all()
	erb :admin, locals: {shirts: shirts}
end

# gets the shoping cart page
get '/shoping_card/:id' do	
end

# CRUD for the tnames class
get '/shirts' do
	puts 'hey'
	shirts = Tname.all();
	shirts.to_json
end

get '/shirt/:id' do 
	id = params[:id]
	shirt = Tname.find_by({id: id})
	shirt.to_json
end

delete '/shirt/:id' do
	id = params[:id]
	Tname.update(id, available: false)
	msg = {
		status: "success"
	}
	# msg.to_json
	redirect '/admin'
end	

put '/shirt/:id' do 
	id = params[:id]
	request.body.rewind
	updated = JSON.parse request.body.read
	Tname.update(id, updated)
	shirt = Tname.find_by({id: id})
	shirt.to_json
end

post '/shirt' do
	shirt = {
		name: params["name"],
		price: params["price"].to_i,
		image_url: params["image_url"],
		available: true
	}
	Tname.create(shirt)
	redirect '/' 
end

#CRUD for ttypes table

get '/types' do
	types = Ttype.all()
	types.to_json
end

get '/type/:id' do
	id = params[:id]
	types = Ttype.where({tname_id: id})
	types.to_json
end

post '/type' do
	type = {
		color: params["color"],
		gender: params["gender"],
		size: params["size"],
		tname_id: params["id"],
		quantity: params["quantity"]
	}
	Ttype.create(type)
	redirect('/')
end

put '/type/:id' do
	request.body.rewind
	updated = JSON.parse request.body.read
	id = params[:id]
	Ttype.update(id, updated)
	type = Ttype.find_by({id: id})
	type.to_json
end

#  CRUD for user

get 'users' do
	buyers = Buyer.all()
	buyers.to_json
end

get '/user/:id' do
	id = params[:id]
	buyer = Buyer.find_by({id: id})
	buyer.to_json
end

post '/user' do
	user = {
		name: params["name"],
		email: params["email"]
	}
	Buyer.create(user);
end

delete '/user/:id' do
	id = params[:id]
	Buyer.destroy(id)

end

put 'user/:id' do
	id = params[:id]
	buyer = {
		name: params["name"],
		email: params["email"]
	}
	Buyer.update(id, buyer)

end

# CRUD for purchases

post '/purchase' do
	purchase = {
		ttypes_id: item_id,
		buyer_id: buyer_id,
		quantity: quantity
	}
	Purchase.create(purchase)
end

put '/purchase/:id' do
	# purchase = {
	# 	ttypes_id: ,
	# 	buyers_id: ,
	# 	quantity: 
	# }
end

delete '/purchase/:id' do
	id = params[:id]
	Purchase.destroy(id)

end

get '/purchase/:id' do
	id = params[:id]
	purchase = Purchase.find_by({buyer_id: id})
	purchase.to_json
end




