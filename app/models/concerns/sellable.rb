module Sellable
  extend ActiveSupport::Concern

  FAREWELL_SALE = 'Farewell Sale'
  GRAND_OPENING = 'Grand Opening'

  included do
    scope :active, -> { where(state: 'active') }
    scope :farewell_sales, -> { where(event_type: FAREWELL_SALE) }
    scope :grand_openings, -> { where(event_type: GRAND_OPENING) }
  end

  def farewell_sale?
    event_type == FAREWELL_SALE
  end

  def grand_opening?
    event_type == GRAND_OPENING
  end
end