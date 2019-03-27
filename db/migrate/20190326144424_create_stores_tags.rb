class CreateStoresTags < ActiveRecord::Migration[6.0]
  def change
    create_table :stores_tags do |t|
      t.references :store, index: true
      t.references :tag, index: true

      t.timestamps
    end

    add_index :stores_tags, [:store_id, :tag_id]
  end
end
