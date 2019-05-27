class SController < ApplicationController
  def index
    search
  end

  def search
    @params = search_params
    @stores = Store.
      filter(search_params).
      active.
      includes(:district, :votes, :comments).
      with_attached_photos.
      group_by { |store| store.district.name }
  end

  private

  def search_params
    params[:search_params].nil? ?
      {} :
      params.
        require(:search_params).
        permit(
          :search_text,
          district_ids: [],
          tag_ids: [],
          event_types: [],
        )
  end
end
