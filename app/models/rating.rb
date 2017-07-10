class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :post

  before_create do
    unless user.ratings.find_by_post_id(post.id).nil?
      raise 'Record Already Exists'
    end
    user.increment(:vote_rating, 1).save
    post.increment(:message_rating, 1).save
  end
end
