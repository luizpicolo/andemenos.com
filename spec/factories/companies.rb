FactoryGirl.define do
  factory :company do
    name Faker::Company.name
    address Faker::Address.street_address
    city factory: :city
    line_of_business factory: :line_of_business
    logo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'assets', 'example.jpg')) }
    description Faker::Lorem.paragraph
    lat Faker::Address.latitude
    log Faker::Address.longitude
    facebook Faker::Internet.url
    website Faker::Internet.url
  end
end
