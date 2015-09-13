FactoryGirl.define do
  factory :country do
    name Faker::Address.country
    iso Faker::Address.state_abbr
  end
end
