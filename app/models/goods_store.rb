# == Schema Information
#
# Table name: goods_stores
#
#  id         :bigint(8)        not null, primary key
#  good_id    :bigint(8)
#  store_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GoodsStore < ApplicationRecord
  belongs_to :good, inverse_of: :goods_stores
  belongs_to :store, inverse_of: :goods_stores
end
