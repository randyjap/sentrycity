class Store < ApplicationRecord
  has_many_attached :photos
  belongs_to :user, inverse_of: :stores
end
