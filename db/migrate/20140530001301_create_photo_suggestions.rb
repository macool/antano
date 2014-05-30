class CreatePhotoSuggestions < ActiveRecord::Migration
  def change
    create_table :photo_suggestions do |t|
      t.integer :user_id, null: false
      t.integer :photo_id, null: false
      t.string :title
      t.text :description
      t.string :year
      t.string :place
      t.text :people

      t.timestamps
    end
    add_index :photo_suggestions, :user_id
    add_index :photo_suggestions, :photo_id
  end
end
