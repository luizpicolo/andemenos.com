require 'rails_helper'

RSpec.describe Offer, type: :model do
  describe 'validates' do
    it { should validate_presence_of(:product) }
    it { should validate_presence_of(:company) }
    it { should validate_presence_of(:offer_price) }
    it { should validate_presence_of(:start_date_offer) }
    it { should validate_presence_of(:end_date_offer) }
  end

  describe 'associations' do
    it { should belong_to(:company) }
    it { should belong_to(:product) }
  end

  describe '#check_price' do
    it 'should return error message' do
      msg = 'O preço em oferta não pode ser maior que o preço regular'
      offer = FactoryGirl.build :offer, regular_price: 3.0, offer_price: 4.0
      expect(offer.check_price[0]).to eq(msg)
    end
  end

  describe '#check_interval_between_dates' do
    it 'should return error message' do
      msg = 'A data inicial não pode ser maior que a data final'
      offer = FactoryGirl.build :offer,
                                start_date_offer: Time.zone.now + 1.day,
                                end_date_offer: Time.zone.now
      expect(offer.check_interval_between_dates[0]).to eq(msg)
    end
  end

  describe '#random_list' do
    it 'should return a list of offers' do
      FactoryGirl.create(:offer)
      expect(Offer.random_list).to match_array(Offer)
    end
  end
end
