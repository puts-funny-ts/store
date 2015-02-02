require 'active_record'

class Tnames < ActiveRecord::Base
	has_many: Ttypes
end