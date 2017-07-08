class Post < ApplicationRecord
  validates_presence_of :message
  validates_length_of :message, maximum: 140, message: 'Maximum number of characters up to 140'
end
