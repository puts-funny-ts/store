require 'active_record'

class Buyers <ActiveRecord::Base
  has_many :purchases
end
