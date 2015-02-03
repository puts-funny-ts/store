require 'active_record'

class Tname <ActiveRecord::Base
	has_many :ttypes
end
