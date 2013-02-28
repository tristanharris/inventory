class Booking < ActiveRecord::Base
  attr_accessible :description, :status_id, :item_flags

  belongs_to :user
  belongs_to :status
  has_many :item_bookings
  has_many :items, :through => :item_bookings

  def item_flags=(flags)
    part = flags.partition{|k,v| v.to_i == 0}
    self.item_ids -= part.first.map{|p| p.first.to_i}
    self.item_ids += part.last.map{|p| p.first.to_i}
  end

end
