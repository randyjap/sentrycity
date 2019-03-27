class District < ApplicationRecord
  has_many :stores, inverse_of: :district
end
