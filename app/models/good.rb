# == Schema Information
#
# Table name: goods
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Good < ApplicationRecord
  has_many :goods_stores, inverse_of: :good
  has_many :stores, through: :goods_stores
end
