FactoryBot.define do
  factory :vote do
    user
    vote { 1 }

    trait :for_comment do
      association(:votable, factory: :comment)
    end

    trait :for_store do
      association(:votable, factory: :store)
    end
  end
end