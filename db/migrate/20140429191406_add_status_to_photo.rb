class AddStatusToPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :allowed, :boolean
    add_column :photos, :status, :integer, default: 0
    add_index :photos, :status
  end
end
