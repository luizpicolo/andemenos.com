require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:product_subcategory) }
    it { should validate_presence_of(:image) }
  end

  describe 'associations' do
    it { should belong_to(:product_subcategory) }
    it { should have_many(:offers) }
  end
end
