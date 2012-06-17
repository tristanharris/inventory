class Tag < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :items_tags
  has_many :items, :through => :items_tags

end
