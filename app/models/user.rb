class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :rememberable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  attr_accessible :name
  validates :name, :presence => true

  has_many :access, :class_name => Access
  has_many :bookings

  def qm?
    !access.role(:qm).empty?
  end

  def booking
    bookings.last || Booking.new
  end

end
