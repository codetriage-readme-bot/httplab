FactoryGirl.define do
  factory :rating do
    association :user, factory: :user
    association :post, factory: :post
    vote Faker::Boolean.boolean
  end
end
