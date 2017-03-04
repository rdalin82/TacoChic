require 'rails_helper'

RSpec.feature "Users visiting the menu page" do

  before do
    menu = FactoryGirl.create(:menu)
    category = FactoryGirl.create(:category, menu: menu)
    @item = FactoryGirl.create(:item, menu: menu, category: category)
    visit root_path
    click_link "Menus"
  end

  scenario "user visiting the main page" do
    expect(page).to have_content("Menu")
    expect(page).to have_content("Brunch")
    expect(page).to have_content("09:00 AM - 11:00 AM")
  end

end
