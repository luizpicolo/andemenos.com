FactoryGirl.define do
  price = Faker::Commerce.price
  factory :offer do
    product factory: :product
    company factory: :company
    regular_price price
    offer_price price - 5
    start_date_offer Time.zone.now
    end_date_offer Time.zone.now + 2.day
  end
end
