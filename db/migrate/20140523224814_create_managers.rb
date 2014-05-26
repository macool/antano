class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :provider, null: false
      t.string :nickname, null: false
      t.timestamps
    end
    add_index :managers, [:provider, :nickname], unique: true
  end
end
