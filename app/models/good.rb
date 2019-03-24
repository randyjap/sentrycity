class Good < ApplicationRecord
  has_many :goods_stores, inverse_of: :good
  has_many :stores, through: :goods_stores
end
