# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  text       :text(65535)
#  user_id    :bigint(8)
#  comment_id :bigint(8)
#  store_id   :bigint(8)
#  state      :string(255)      default("active"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  include Votable

  belongs_to :user, inverse_of: :comments
  belongs_to :store, inverse_of: :comments
  belongs_to :comment, inverse_of: :comments, optional: true
  has_many :comments, inverse_of: :comment
  has_many :votes, inverse_of: :votable, as: :votable
end
