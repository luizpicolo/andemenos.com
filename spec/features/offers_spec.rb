require 'rails_helper'

feature 'list offer in home' do
  scenario 'with finish date offer greater than current date' do
    offer = FactoryGirl.create(:offer)
    visit root_path
    expect(page).to have_content(offer.product.name)
  end

  scenario 'with finish date offer below than current date' do
    offer = FactoryGirl.create :offer,
                               start_date_offer: Time.zone.now - 3.days,
                               end_date_offer: Time.zone.now - 2.days
    visit root_path
    expect(page).not_to have_content(offer.product.name)
  end
end

feature 'list offer in' do
  let!(:offer) { FactoryGirl.create :offer }

  scenario 'category page with associated product' do
    visit root_path
    click_link(offer.category.name)
    expect(page).to have_content(offer.product.name)
  end

  scenario 'subcategory page with associated product' do
    visit root_path
    click_link(offer.subcategory.name)
    expect(page).to have_content(offer.product.name)
  end
end
