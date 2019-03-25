class AddDiscountToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :discount, :string
  end
end
