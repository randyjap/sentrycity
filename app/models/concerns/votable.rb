module Votable
  extend ActiveSupport::Concern

  def up_vote(user_id)
    Vote.find_or_create_by(votable: self, user_id: user_id) do |vote|
      vote.vote = 1
    end
  end

  def down_vote(user_id)
    Vote.find_or_create_by(votable: self, user_id: user_id) do |vote|
      vote.vote = -1
    end
  end

  def vote_count
    votes.sum { |v| v.vote }
  end

  def vote_count_message
    "#{vote_count} #{"Point".pluralize(vote_count)}"
  end
end