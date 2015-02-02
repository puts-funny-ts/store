require 'active_record'

class Buyers <ActiveRecord::Base
  has_many: purchases
  def purchases
    Purchase.where({buyers_id: self.id})
  end
end
