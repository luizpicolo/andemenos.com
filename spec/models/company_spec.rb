require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:logo) }
  end

  describe 'associations' do
    it { should belong_to(:city) }
    it { should belong_to(:line_of_business) }
    it { should have_many(:offers) }
  end
end
