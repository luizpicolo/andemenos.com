require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:product_subcategories) }
  end

  describe '#list_subcategories' do
    let(:ps) { FactoryGirl.build :product_category }
    it 'should to return ProductSubcategory type object' do
      expect(ps.list_subcategories.build).to be_kind_of(ProductSubcategory)
    end

    # Wo my God. Sorry :P
    it 'should to return subcategories ordened by amount offers created' do
      c = FactoryGirl.create :product_category, name: 'Category_1'

      sc_1 = FactoryGirl.create :product_subcategory, name: 'Subcategory_1',
                                                      product_category: c
      sc_2 = FactoryGirl.create :product_subcategory, name: 'Subcategory_2',
                                                      product_category: c

      product_1 = FactoryGirl.create :product, name: 'product_1',
                                               product_subcategory: sc_2
      product_2 = FactoryGirl.create :product, name: 'product_2',
                                               product_subcategory: sc_2
      product_3 = FactoryGirl.create :product, name: 'product_3',
                                               product_subcategory: sc_1

      FactoryGirl.create :offer, product: product_1
      FactoryGirl.create :offer, product: product_2
      FactoryGirl.create :offer, product: product_3

      expect(c.list_subcategories.first.name).to eq('Subcategory_2')
      expect(c.list_subcategories.last.name).to eq('Subcategory_1')
    end
  end
end
