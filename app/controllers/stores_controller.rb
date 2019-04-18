class StoresController < ApplicationController
  before_action :require_login

  def bookmark
    @new_store = Store.find(params[:id])
    @new_store.bookmark_toggle(current_user.id)
  end

  def create_a_store
    @store = Store.find_or_create_by(user: current_user, state: 'draft')
    step = params[:step].nil? ? 0 : params[:step].to_i - 1
    @template_no = [1, 2, 3, 4, 5][step]
  end

  def update_create_a_store
    @store = Store.find_by(user: current_user, state: 'draft')
    @store.update(update_store_params)
    @store.update(state: 'active') if params[:finished] == 'true'
  end

  def comments
    @new_store = Store.find(params[:id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    @new_store.comments << comment
  end

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

  private

  def vote_params
    params.require(:store_vote).permit(:vote)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def update_store_params
    params.
      require(:store_params).
      permit(
        :name,
        :event_date,
        :event_type,
        :district_id,
        :address,
        :description,
        :discount,
        :bhours_0,
        :bhours_1,
        :bhours_2,
        :bhours_3,
        :bhours_4,
        :bhours_5,
        :bhours_6,
        :bhours_7,
        :phone,
        :url,
        :lat,
        :lng,
        tag_ids: []
      )
  end
end
