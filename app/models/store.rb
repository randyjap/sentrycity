# == Schema Information
#
# Table name: stores
#
#  id          :bigint(8)        not null, primary key
#  name        :string(255)
#  event_type  :string(255)
#  event_date  :datetime
#  address     :string(255)
#  lat         :decimal(10, 6)
#  lng         :decimal(10, 6)
#  description :text(65535)
#  bhours_0    :string(255)
#  bhours_1    :string(255)
#  bhours_2    :string(255)
#  bhours_3    :string(255)
#  bhours_4    :string(255)
#  bhours_5    :string(255)
#  bhours_6    :string(255)
#  bhours_7    :string(255)
#  phone       :string(255)
#  url         :text(65535)
#  state       :string(255)      default("draft"), not null
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  discount    :string(255)
#  district_id :bigint(8)
#

class Store < ApplicationRecord
  FAREWELL = 'Farewell Sale'
  GRAND_OPENING = 'Grand Opening'

  include Votable
  include Sellable
  include Commentable
  include Bookmarkable
  include Filterable

  scope :search_text, -> (search_text) { where("stores.name LIKE ?", "%#{sanitize_sql_like(search_text)}%") }
  scope :district_ids, -> (district_ids) { where(district_id: district_ids) }
  scope :tag_ids, -> (tag_ids) { includes(:tags).where(tags: { id: tag_ids }) }
  scope :event_types, -> (event_types) { where(event_type: event_types) }

  validates_presence_of :state

  has_many_attached :photos
  belongs_to :user, inverse_of: :stores
  belongs_to :district, inverse_of: :stores, optional: true
  has_many :goods_stores, inverse_of: :store
  has_many :goods, through: :goods_stores
  has_many :comments, -> { order("created_at DESC") }, inverse_of: :store
  has_many :bookmarks, inverse_of: :store
  has_many :votes, inverse_of: :votable, as: :votable
  has_many :stores_tags, inverse_of: :store
  has_many :tags, through: :stores_tags

  def farewell_sale?
    self.event_type == FAREWELL
  end

  def grand_opening?
    self.event_type == GRAND_OPENING
  end

  def self.format_bhours(original_hours)
    open, close = original_hours.split(';')
    open = open + ':00'
    close = close + ':00'
    open + ' - ' + close
  end
end
