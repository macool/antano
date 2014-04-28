class AddTwitterFieldsToPhoto < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.text :tweet
      t.boolean :allowed, default: false
    end
  end
end
