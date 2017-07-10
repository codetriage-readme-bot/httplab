class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :vote_rating
      t.integer :posts_count

      t.timestamps
    end
  end
end
