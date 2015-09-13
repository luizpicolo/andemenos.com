FactoryGirl.define do
  factory :product do
    name Faker::Commerce.product_name
    product_subcategory factory: :product_subcategory
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'assets', 'example.jpg')) }
  end
end
