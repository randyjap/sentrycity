# == Schema Information
#
# Table name: stores_tags
#
#  id         :bigint(8)        not null, primary key
#  store_id   :bigint(8)
#  tag_id     :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe StoresTag, type: :model do
  subject { FactoryBot.build :stores_tag }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:store) }
    it { should belong_to(:tag) }
  end
end
