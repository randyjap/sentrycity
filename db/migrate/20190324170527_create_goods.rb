class CreateGoods < ActiveRecord::Migration[6.0]
  def change
    create_table :goods do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :goods, :name
  end
end
