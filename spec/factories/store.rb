FactoryBot.define do
  factory :store do
    user
    district
    state { 'active' }
  end
end