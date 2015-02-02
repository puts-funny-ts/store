require 'active_record'

class Tname < ActiveRecord::Base
	has_many: Ttypes
end