require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:iso) }
  end

  describe 'associations' do
    it { should have_many(:states) }
  end
end
