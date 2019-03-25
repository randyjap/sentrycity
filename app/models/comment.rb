class Comment < ApplicationRecord
  include Votable

  belongs_to :user, inverse_of: :comments
  belongs_to :store, inverse_of: :comments
  belongs_to :comment, inverse_of: :comments, optional: true
  has_many :comments, inverse_of: :comment
  has_many :votes, inverse_of: :votable, as: :votable
end
