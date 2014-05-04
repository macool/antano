class RemoveTweetFromPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :tweet, :text
  end
end
