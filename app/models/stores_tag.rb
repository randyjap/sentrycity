# == Schema Information
#
# Table name: stores_tags
#
#  id         :bigint(8)        not null, primary key
#  store_id   :bigint(8)
#  tag_id     :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StoresTag < ApplicationRecord
  belongs_to :store, inverse_of: :stores_tags
  belongs_to :tag, inverse_of: :stores_tags
end
