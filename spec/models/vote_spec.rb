# == Schema Information
#
# Table name: votes
#
#  id           :bigint(8)        not null, primary key
#  votable_type :string(255)
#  votable_id   :bigint(8)
#  user_id      :bigint(8)
#  vote         :decimal(1, )     not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Vote, type: :model do
  subject { FactoryBot.build :vote, :for_comment }
  let(:comment_vote) { FactoryBot.build :vote, :for_comment }
  let(:store_vote) { FactoryBot.build :vote, :for_store }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
      expect(comment_vote).to be_valid
      expect(store_vote).to be_valid
    end

    it "is NOT valid without a vote" do
      expect(subject).to validate_presence_of(:vote)
    end
  end

  describe "Associations" do
    it { should belong_to(:votable) }
    it { should belong_to(:user) }
  end
end
