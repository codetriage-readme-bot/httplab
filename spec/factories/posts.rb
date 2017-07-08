FactoryGirl.define do
  factory :post do
    association :user, factory: :user
    message Faker::Hacker.say_something_smart
  end
end
