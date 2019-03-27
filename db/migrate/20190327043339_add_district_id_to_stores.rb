class AddDistrictIdToStores < ActiveRecord::Migration[6.0]
  def change
    add_reference :stores, :district, index: true
  end
end
