require 'active_record'

class Purchases < ActiveRecord::Base
  belongs_to :buyers
end
