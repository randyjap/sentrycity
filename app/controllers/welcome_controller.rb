class WelcomeController < ApplicationController
  def index
    all_stores = Store.active.includes(:votes, :comments).with_attached_photos
    @farewell_stores = all_stores.select(&:farewell_sale?)
    @grand_openings = all_stores.select(&:grand_opening?)
  end
end
