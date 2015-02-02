require 'active_record'

class Ttype < ActiveRecord::Base
	belongs_to :tname
end
