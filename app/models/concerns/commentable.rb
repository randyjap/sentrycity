module Commentable
  extend ActiveSupport::Concern

  def comment_count
    comments.size
  end

  def comment_count_message
    "#{comment_count} #{"Post".pluralize(comment_count)}"
  end

  def comment_vote_total
    self.class.includes(comments: :votes).find(self.id).comments.sum { |comment| comment.vote_count }
  end
end