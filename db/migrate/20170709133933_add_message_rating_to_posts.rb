class AddMessageRatingToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :message_rating, :integer
  end
end
