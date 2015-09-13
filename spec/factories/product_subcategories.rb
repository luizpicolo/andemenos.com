FactoryGirl.define do
  factory :product_subcategory do
    name Faker::Name.name
    product_category factory: :product_category
  end
end
