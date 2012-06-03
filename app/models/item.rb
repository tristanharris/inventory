class Item < ActiveRecord::Base
  attr_accessible :description, :location, :name, :store_image, :usage_image

  mount_uploader :store_image, ItemImageUploader
  mount_uploader :usage_image, ItemImageUploader

end
