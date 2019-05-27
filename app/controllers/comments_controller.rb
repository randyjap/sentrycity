class CommentsController < ApplicationController
  def destroy
    comment = Comment.find(params[:id])
    if comment.user == current_user
      comment.destroy
      @store = comment.store
      render "stores/comments"
    else
      render js: {}, status: 401
    end
  end

  def comment_vote
    comment = Comment.find(params[:id])
    if comment.user == current_user
      if comment_params[:vote] == "1"
        comment.up_vote(current_user.id)
      elsif comment_params[:vote] == "-1"
        comment.down_vote(current_user.id)
      end
      @store = comment.store
      render "stores/comments"
    else
      render js: {}, status: 401
    end
  end

  private

  def comment_params
    params.require(:comment_vote).permit(:vote)
  end
end
