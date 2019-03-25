class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :user, index: true
      t.references :store, index: true
      t.references :comment, index: true
      t.string :state, null: false, default: "active"

      t.timestamps
    end

    add_index :comments, :state
  end
end
