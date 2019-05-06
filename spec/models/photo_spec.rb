# == Schema Information
#
# Table name: active_storage_attachments
#
#  id          :bigint(8)        not null, primary key
#  name        :string(255)      not null
#  record_type :string(255)      not null
#  record_id   :bigint(8)        not null
#  blob_id     :bigint(8)        not null
#  created_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Photo, type: :model do
  subject { FactoryBot.build :photo, :for_store }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:record) }
  end
end
