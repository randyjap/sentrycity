class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :event_type, null: false
      t.datetime :event_date, null: false
      t.string :district, null: false
      t.string :address, null: false
      t.decimal :lat, null: false, precision: 10, scale: 6
      t.decimal :lng, null: false, precision: 10, scale: 6
      t.text :description
      t.string :bhours_0
      t.string :bhours_1
      t.string :bhours_2
      t.string :bhours_3
      t.string :bhours_4
      t.string :bhours_5
      t.string :bhours_6
      t.string :bhours_7
      t.string :phone
      t.text :url
      t.string :state, null: false, default: "draft"
      t.references :user, index: true

      t.timestamps
    end

    add_index :stores, :name
    add_index :stores, :event_type
    add_index :stores, :district
    add_index :stores, :state
  end
end
