require 'active_record'

class Tname < ActiveRecord::Base
	def ttypes
		Ttype.where({tname_id: self.id})
	end
	def roar
		puts 'roar'
	end
end