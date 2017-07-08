class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create do
    user.increment(:vote_rating, 1)
  end
end
