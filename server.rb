require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader'
require_relative './models/connection'
require_relative './models/buyers'
require_relative './models/t_name'
require_relative './models/t_type'
require_relative './models/connection'
require 'pry'

after do
	ActiveRecord::Base.connection.close
end

get '/shirts' do
	shirts = Tname.all()
	shirts = Tname.where({available: true})
	types =  Ttype.all()
	colors = Ttype.uniq.pluck(:color)
	sizes = Ttype.uniq.pluck(:size)
	genders = Ttype.uniq.pluck(:gender)

	erb(:index, { locals: { shirts: shirts,
													types: types,
													colors: colors,
													sizes: sizes,
													genders: genders}})
end

get '/shirt/:id' do

end

# post '/purchase' do
# 	purchase = {
# 		ttypes_id: item_id,
# 		buyer_id: buyer_id,
# 		quantity: quantity
# 	}
# 	Purchase.create(purchase)
# end

post '/purchase' do

	type = Ttype.find_by({tname_id: params["tname"],
												 color: params["color"],
												 size: params["size"],
												 gender: params["gender"]})

	shirt = Tname.find_by({id: params["tname"]})
	image = shirt.image_url
	cart = {
		color: params["color"],
		size: params["size"],
		gender: params["gender"],
		tname: params["tname"]
	}
	erb(:cart, {locals: {cart: cart, type: type, shirt: shirt }})

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
