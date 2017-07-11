class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :vote_rating, default: 0, null: false
      t.integer :posts_count, default: 0, null: false

      t.timestamps
    end
  end
end
