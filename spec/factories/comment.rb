FactoryBot.define do
  factory :comment do
    user
    store
    text { "A user comment" }
  end
end