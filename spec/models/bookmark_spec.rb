# == Schema Information
#
# Table name: bookmarks
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  store_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  subject { FactoryBot.build :bookmark }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:store) }
  end
end
