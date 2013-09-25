FactoryGirl.define do
  factory :user, aliases: [:owner]  do
    sequence(:username) { |n| "test#{n}"}
    password "password"
    password_confirmation "password"
  end
end