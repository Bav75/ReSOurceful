class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :answer_id, null: false, unique: true 
      t.string :title, null: false
      t.string :post_link, null: false 

      t.timestamps
    end
  end
end
