class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :provider, null: false
      t.references :photo, null: false
      t.text :obj, null: false
      t.timestamps
    end
    add_index :shares, :provider
    add_index :shares, [:provider, :photo_id]
  end
end
