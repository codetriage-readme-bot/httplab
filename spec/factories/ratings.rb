FactoryGirl.define do
  factory :rating do
    association :user, factory: :user
    association :post, factory: :post
    vote true
  end
end
