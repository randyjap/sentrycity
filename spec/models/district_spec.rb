# == Schema Information
#
# Table name: districts
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe District, type: :model do
  subject { FactoryBot.build :district }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is NOT valid without a name" do
      expect(subject).to validate_presence_of(:name)
    end
  end

  describe "Associations" do
    it { should have_many(:stores) }
  end
end
