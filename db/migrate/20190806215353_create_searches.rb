class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.references :user, foreign_key: {name: "user_search_id_fk"} 
      t.references :post, foreign_key: {name: "post_search_id_fk"}
      t.string :tags, array: true, null: false 

      t.timestamps
    end
  end
end
