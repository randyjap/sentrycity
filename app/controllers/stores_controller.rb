class StoresController < ApplicationController
  def show
    @store = Store.includes(comments: :user).find(params[:id])
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
    comment = Comment.new(comment_params)
    comment.user = current_user
    @new_store.comments << comment
  end

  def bookmark
    @new_store = Store.find(params[:id])
    @new_store.bookmark_toggle(current_user.id)
  end

  private

  def vote_params
    params.require(:store_vote).permit(:vote)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
