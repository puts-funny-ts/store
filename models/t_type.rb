require 'active_record'

class Ttype << ActiveRecord::Base
	belongs_to: Tname
	has_many: Purchases
end