FactoryGirl.define do
  factory :line_of_business do
    name Faker::Company.suffix
  end
end
