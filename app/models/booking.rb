class Booking < ActiveRecord::Base
  attr_accessible :description, :status_id, :item_flags, :from, :to

  belongs_to :user
  belongs_to :status
  has_many :item_bookings
  has_many :items, :through => :item_bookings

  validates :status_id, :user_id, :presence => true
  validates :items, :presence => {:message => 'are required'}

  validates :from, :to, :description, :presence => true, :if => lambda{|b| b.status_id > 1}

  scope :pending, where(:status_id => 1)

  def item_flags=(flags)
    part = flags.partition{|k,v| v.to_i == 0}
    self.item_ids -= part.first.map{|p| p.first.to_i}
    self.item_ids += part.last.map{|p| p.first.to_i}
  end

end
