FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "test#{n}"}
    password "password"
    password_confirmation "password"
  end
end