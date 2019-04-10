class WelcomeController < ApplicationController
  def index
    @farewell_stores =
      Store.
        active.
        includes(:votes, :comments).
        with_attached_photos.
        where(event_type: 'Farewell Sale').
        limit(30)
    @grand_openings =
      Store.
        active.
        includes(:votes, :comments).
        with_attached_photos.
        where(event_type: 'Grand Opening').
        limit(30)
  end
end
