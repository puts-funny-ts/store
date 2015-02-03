require 'active_record'

class Buyer < ActiveRecord::Base
	has_many:Purchase
	# def purchases
	# 	Purchase
end

