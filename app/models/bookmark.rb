class Bookmark < ApplicationRecord
  belongs_to :user, inverse_of: :bookmarks
  belongs_to :store, inverse_of: :bookmarks
end
