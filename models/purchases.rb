require 'active_record'

class Purchase < ActiveRecord::Base
	belongs_to:Buyers
	belongs_to:Ttypes
end
