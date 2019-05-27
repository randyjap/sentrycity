require('./db/districts')

FactoryBot.define do
  factory :district do
    sequence :name do |n|
      raise if n >= DISTRICT_NAMES.count

      DISTRICT_NAMES[n]
    end
  end
end