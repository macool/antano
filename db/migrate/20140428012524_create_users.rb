class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombres, null: false
      t.string :email
      t.string :imagen_url
      t.boolean :admin, default: false
      t.boolean :banned, default: false
      t.timestamps
    end
  end
end
