class GoodsStore < ApplicationRecord
  belongs_to :good, inverse_of: :goods_stores
  belongs_to :store, inverse_of: :goods_stores
end
