require 'activerecord'

class Tname << ActiveRecord::Base
	has_many: Ttypes
end