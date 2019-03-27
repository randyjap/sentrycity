class Store < ApplicationRecord
  include Votable
  include Sellable
  include Commentable
  include Bookmarkable

  has_many_attached :photos
  belongs_to :user, inverse_of: :stores
  has_many :goods_stores, inverse_of: :store
  has_many :goods, through: :goods_stores
  has_many :comments, inverse_of: :store
  has_many :bookmarks, inverse_of: :store
  has_many :votes, inverse_of: :votable, as: :votable
  has_many :stores_tags, inverse_of: :store
  has_many :tags, through: :stores_tags
end
