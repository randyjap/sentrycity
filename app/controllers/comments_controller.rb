class CommentsController < ApplicationController
  def destroy
    comment = Comment.find(params[:id])
    if comment.user.id == current_user.id
      comment.destroy
    end

    @new_store = comment.store
    render "stores/comments"
  end

  def comment_vote
    comment = Comment.find(params[:id])
    if comment_params[:vote] == "1"
      comment.up_vote(current_user.id)
    elsif comment_params[:vote] == "-1"
      comment.down_vote(current_user.id)
    end

    @new_store = comment.store
    render "stores/comments"
  end

  private

  def comment_params
    params.require(:comment_vote).permit(:vote)
  end
end
