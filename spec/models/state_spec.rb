require 'rails_helper'

RSpec.describe State, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:iso) }
    it { should validate_presence_of(:country) }
  end

  describe 'associations' do
    it { should have_many(:cities) }
    it { should belong_to(:country) }
  end
end
