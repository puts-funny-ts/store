require 'active_record'

class Buyer < ActiveRecord::Base
	has_many: Purchases
end

