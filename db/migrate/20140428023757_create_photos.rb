class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title, null: false
      t.string :image
      t.string :description
      t.integer :position, default: 0

      t.timestamps
    end
    add_index :photos, :position
  end
end
