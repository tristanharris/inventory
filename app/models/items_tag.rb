class ItemsTag < ActiveRecord::Base
  attr_accessible :item, :tag

  belongs_to :item
  belongs_to :tag

end
