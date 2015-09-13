require 'rails_helper'

RSpec.describe LineOfBusiness, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:companies) }
  end
end
