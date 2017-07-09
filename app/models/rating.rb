class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :post

  before_create do
    if user.ratings.find_by_post_id(post.id).nil?
      user.increment(:vote_rating, 1).save
      post.increment(:message_rating, 1).save
    else
      raise 'Record Already Exists'
    end
  end
end
