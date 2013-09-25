class User < ActiveRecord::Base
  has_many :created_fundraisers, class_name: "Fundraiser", foreign_key: :owner_id

  has_secure_password

  attr_accessible :username, :password, :password_confirmation

  before_validation :create_token

  def create_token
    self.token = SecureRandom.urlsafe_base64(32)
  end
end