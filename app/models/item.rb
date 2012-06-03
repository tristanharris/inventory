class Item < ActiveRecord::Base
  attr_accessible :description, :location, :name
end
