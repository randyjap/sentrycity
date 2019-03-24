class Store < ApplicationRecord
  has_many_attached :photos
  belongs_to :user, inverse_of: :stores
  has_many :goods_stores, inverse_of: :store
  has_many :goods, through: :goods_stores
end
