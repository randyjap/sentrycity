# == Schema Information
#
# Table name: stores
#
#  id          :bigint(8)        not null, primary key
#  name        :string(255)
#  event_type  :string(255)
#  event_date  :datetime
#  address     :string(255)
#  lat         :decimal(10, 6)
#  lng         :decimal(10, 6)
#  description :text(65535)
#  bhours_0    :string(255)
#  bhours_1    :string(255)
#  bhours_2    :string(255)
#  bhours_3    :string(255)
#  bhours_4    :string(255)
#  bhours_5    :string(255)
#  bhours_6    :string(255)
#  bhours_7    :string(255)
#  phone       :string(255)
#  url         :text(65535)
#  state       :string(255)      default("draft"), not null
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  discount    :string(255)
#  district_id :bigint(8)
#

require 'rails_helper'

RSpec.describe Store, type: :model do
  subject { FactoryBot.build :store }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is NOT valid without a vote" do
      expect(subject).to validate_presence_of(:state)
    end
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:district).optional }

    it { should have_many(:goods_stores) }
    it { should have_many(:goods) }
    it { should have_many(:comments) }
    it { should have_many(:bookmarks) }
    it { should have_many(:votes) }
    it { should have_many(:stores_tags) }
    it { should have_many(:tags) }
  end
end
