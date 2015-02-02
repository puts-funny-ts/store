require 'active_record'

class Purchases << ActiveRecord::Base
	belongs_to: Buyers
	belongs_to: Ttypes
end