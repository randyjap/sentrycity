FactoryBot.define do
  factory :photo do
    blob

    trait :for_store do
      association(:record, factory: :store)
    end
  end
end