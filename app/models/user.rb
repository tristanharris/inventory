class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :rememberable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :provider, :uid
  # attr_accessible :title, :body
  attr_accessible :name
  validates :name, :presence => true

  has_many :access, :class_name => Access

  def qm?
    !access.role(:qm).empty?
  end

  def self.find_for_open_id(auth)
    return nil if auth.provider.nil? || auth.uid.nil?
    if user = User.where(:provider => auth.provider, :uid => auth.uid).first
      user.update_attributes(:name => auth.name, :email => auth.email)
      user
    else
      data = auth.info
      User.create!(:name => data.name,
                   :email => data.email,
                   :password => Devise.friendly_token[0,20],
                   :provider => auth.provider,
                   :uid => auth.uid
                  )
    end
  end

end
