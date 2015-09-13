FactoryGirl.define do
  factory :state do
    name Faker::Address.state
    iso Faker::Address.state_abbr
    country factory: :country
  end
end
