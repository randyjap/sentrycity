class PhotoUploadsController < ApplicationController
  def create
    @store = current_user.current_draft
    @store.photos.attach(params[:file])
    @store.reload
  end

  def destroy
    photo = Photo.find(params[:id])
    @store = photo.store
    photo.purge if photo.store.user == current_user
  end
end
