class ItemBooking < ActiveRecord::Base
  attr_accessible :item, :booking

  belongs_to :item
  belongs_to :booking

end
