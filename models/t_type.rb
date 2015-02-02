require 'activerecord'

class Ttype << ActiveRecord::Base
	belongs_to: Tname
end