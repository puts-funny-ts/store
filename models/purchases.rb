require 'active_record'

class Purchases < ActiveRecord::Base
  belongs_to: Buyers
end
