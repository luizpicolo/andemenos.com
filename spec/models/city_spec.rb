require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:state) }
  end
end
