require 'rails_helper'

RSpec.describe ProductSubcategory, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:product_category) }
    it { should have_many(:products) }
  end
end
