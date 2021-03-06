class Post < ApplicationRecord
  validates_presence_of :message
  validates_length_of :message, maximum: 140, message: 'Maximum number of characters up to 140'
  belongs_to :user
  has_many :ratings

  before_create do
    user.increment(:posts_count, 1).save
  end
end
