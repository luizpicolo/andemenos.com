require 'rails_helper'

feature 'menu navigation' do
  scenario 'list category and subcategory with associated products' do
    offer = FactoryGirl.create(:offer)
    visit root_path
    expect(page).to have_content(offer.category.name)
    expect(page).to have_content(offer.subcategory.name)
  end

  scenario 'not list subcategory with associated products' do
    category = FactoryGirl.create(:product_category)
    subcategory = FactoryGirl.create(:product_subcategory)
    visit root_path
    expect(page).to have_content(category.name)
    expect(page).not_to have_content(subcategory.name)
  end
end
