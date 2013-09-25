# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_users
  10.times do |i|
    User.create(username: "test#{1}", password: 'password', password_confirmation: 'password')
  end
end

def create_fundraisers
  5.times do |i|
    User.find(i + 1).created_fundraisers.create(name: "test_fundraiser#{i}", description: 'a test fundraiser', goal: 100)
  end
end

def follow_fundraisers
  User.all.each do |user|
    Fundraiser.all.each do |fundraiser|
      fundraiser.donations.create(follower: user, amount: 10)
    end
  end
end

create_users
create_fundraisers
follow_fundraisers