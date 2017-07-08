FactoryGirl.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password = Faker::Internet.password
    password password
    password_confirmation password

    vote_rating Faker::Number.number(4)
    posts_count Faker::Number.number(2)
  end
end
