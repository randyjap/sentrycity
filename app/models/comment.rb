class Comment < ApplicationRecord
  belongs_to :user, inverse_of: :comments
  belongs_to :store, inverse_of: :comments
  belongs_to :comment, inverse_of: :comments, optional: true
  has_many :comments, inverse_of: :comment
end
