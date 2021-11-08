class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :user_email
      t.integer :likes_count
      t.integer :dislikes_count
      t.integer :comments_count

      t.timestamps
    end
  end
end
