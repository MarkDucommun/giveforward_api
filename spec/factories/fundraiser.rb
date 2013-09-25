FactoryGirl.define do
  factory :fundraiser do
    owner
    sequence(:name) { |n| "Test#{n}"}
    description "A test fundraiser"
    goal 100

    factory :fundraiser_with_followers do
      after(:build) do |fundraiser|
        FactoryGirl.create_list(:user, 10).each do |user|
          factory.donations.create(user: user, donation: 10)
        end
      end
    end
  end
end