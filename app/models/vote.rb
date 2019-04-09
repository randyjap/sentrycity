# == Schema Information
#
# Table name: votes
#
#  id           :bigint(8)        not null, primary key
#  votable_type :string(255)
#  votable_id   :bigint(8)
#  user_id      :bigint(8)
#  vote         :decimal(1, )     not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
end
