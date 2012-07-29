class Tag < ActiveRecord::Base
  attr_accessible :description, :name, :item_ids

  has_many :items_tags
  has_many :items, :through => :items_tags

  default_scope order(:name)

end
