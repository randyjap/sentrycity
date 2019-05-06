# == Schema Information
#
# Table name: goods_stores
#
#  id         :bigint(8)        not null, primary key
#  good_id    :bigint(8)
#  store_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe GoodsStore, type: :model do
  subject { FactoryBot.build :goods_store }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:good) }
    it { should belong_to(:store) }
  end
end
