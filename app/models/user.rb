class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :screen_name

  validates_uniqueness_of :email
end
