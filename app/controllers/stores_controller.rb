class StoresController < ApplicationController
  def show
    @store = Store.find(params[:id])
    @vote_count = @store.vote_count
  end

  def store_vote
    @new_store = Store.find(params[:id])
    if vote_params[:vote] == "1"
      @new_store.up_vote(current_user.id)
    elsif vote_params[:vote] == "-1"
      @new_store.down_vote(current_user.id)
    end

    @new_vote_count = @new_store.vote_count
  end

  def comments
    @new_store = Store.find(params[:id])

  end

  private

  def vote_params
    params.permit(:id, :vote)
  end

  def comment_params
    params.permit(:id, :comment)
  end
end
