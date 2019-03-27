class Tag < ApplicationRecord
  has_many :stores_tags, inverse_of: :tag
  has_many :stores, through: :stores_tags
end
