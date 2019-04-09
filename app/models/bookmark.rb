# == Schema Information
#
# Table name: bookmarks
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  store_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bookmark < ApplicationRecord
  belongs_to :user, inverse_of: :bookmarks
  belongs_to :store, inverse_of: :bookmarks
end
