class StoresTag < ApplicationRecord
  belongs_to :store, inverse_of: :stores_tags
  belongs_to :tag, inverse_of: :stores_tags
end
