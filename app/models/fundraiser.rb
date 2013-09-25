class Fundraiser < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  has_many :donations
  has_many :followers, through: :donations, source: :user

  validates_presence_of :name, :description

  attr_accessible :owner, :name, :description, :goal
end