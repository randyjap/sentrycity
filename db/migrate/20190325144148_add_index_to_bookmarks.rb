class AddIndexToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_index :bookmarks, [:user_id, :store_id]
  end
end
