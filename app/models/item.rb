class Item < ActiveRecord::Base
  attr_accessible :description, :location, :name, :store_image, :usage_image, :remove_store_image, :remove_usage_image, :tag_ids, :room_id

  mount_uploader :store_image, ItemImageUploader
  mount_uploader :usage_image, ItemImageUploader

  has_many :items_tags
  has_many :tags, :through => :items_tags
  belongs_to :room

end
