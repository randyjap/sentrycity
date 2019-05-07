module Votable
  extend ActiveSupport::Concern

  def up_voted?(user_id)
    return nil if user_id.nil?
    Vote.find_by(votable: self, user_id: user_id, vote: 1)
  end

  def down_voted?(user_id)
    return nil if user_id.nil?
    Vote.find_by(votable: self, user_id: user_id, vote: -1)
  end

  def up_vote(user_id)
    vote = Vote.find_by(votable: self, user_id: user_id)
    if vote.nil?
      Vote.create!(votable: self, user_id: user_id, vote: 1)
    else vote
      vote.update(vote: vote.vote == 1 ? 0 : 1)
    end
  end

  def down_vote(user_id)
    vote = Vote.find_by(votable: self, user_id: user_id)
    if vote.nil?
      Vote.create!(votable: self, user_id: user_id, vote: -1)
    else vote
      vote.update(vote: vote.vote == -1 ? 0 : -1)
    end
  end

  def vote_count
    votes.sum { |v| v.vote }
  end
end