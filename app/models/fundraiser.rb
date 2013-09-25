class Fundraiser < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  attr_accessible :owner, :name, :description, :goal
end