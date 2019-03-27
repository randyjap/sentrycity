class RemoveDistrictFromStores < ActiveRecord::Migration[6.0]
  def change
    remove_column :stores, :district
  end
end
