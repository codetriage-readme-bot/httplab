class AddPostIdToRatings < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :post_id, :integer
    add_index :ratings, :post_id
  end
end
