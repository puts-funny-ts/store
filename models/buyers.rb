require 'active_record'

<<<<<<< HEAD
class Buyers <ActiveRecord::Base
  has_many :purchases
  # def purchases
  #   Purchase.where({buyers_id: self.id})
  # end
=======
class Buyer < ActiveRecord::Base
	has_many: Purchases
>>>>>>> 10ad7afce4e0c27966c82efbbfdda6dbb4852491
end

