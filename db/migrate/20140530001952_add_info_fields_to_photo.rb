class AddInfoFieldsToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :year, :string
    add_column :photos, :place, :string
    add_column :photos, :people, :text
  end
end
