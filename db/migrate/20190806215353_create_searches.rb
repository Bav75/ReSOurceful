class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :answer, foreign_key: true

      t.string :tags, array: true, null: false 

      t.timestamps
    end
  end
end
