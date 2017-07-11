class AddMessageRatingToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :message_rating, :integer, default: 0, null: false
  end
end
