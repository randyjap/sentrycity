class RemoveRestraintsFromStores < ActiveRecord::Migration[6.0]
  def change
    change_column_null :stores, :name, true
    change_column_null :stores, :event_type, true
    change_column_null :stores, :event_date, true
    change_column_null :stores, :address, true
    change_column_null :stores, :lat, true
    change_column_null :stores, :lng, true
  end
end