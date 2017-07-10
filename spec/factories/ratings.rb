FactoryGirl.define do
  factory :rating do
    association :post, factory: :post
    vote true
  end
end
