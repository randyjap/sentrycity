class CreateGoodsStores < ActiveRecord::Migration[6.0]
  def change
    create_table :goods_stores do |t|
      t.references :good, index: true
      t.references :store, index: true

      t.timestamps
    end
  end
end
