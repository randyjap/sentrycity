# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  text       :text(65535)
#  user_id    :bigint(8)
#  comment_id :bigint(8)
#  store_id   :bigint(8)
#  state      :string(255)      default("active"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { FactoryBot.build :comment }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is NOT valid without a comment" do
      expect(subject).to validate_presence_of(:text)
    end
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:store) }
    it { should belong_to(:comment).optional }

    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end
end
