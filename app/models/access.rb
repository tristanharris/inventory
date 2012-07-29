class Access < ActiveRecord::Base
  attr_accessible :role, :user
  belongs_to :user

  scope :role, lambda {|role| where :role => role }
end
