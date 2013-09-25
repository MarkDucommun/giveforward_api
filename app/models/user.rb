class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  has_secure_password

  before_validation :create_token

  def create_token
    self.token = SecureRandom.urlsafe_base64(32)
  end
end