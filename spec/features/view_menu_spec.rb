


require 'rails_helper'

RSpec.feature "Users visiting the menu page" do

  before do
    menu = FactoryGirl.create(:menu)
    category = FactoryGirl.create(:category, menu: menu)
    @item = FactoryGirl.create(:item, menu: menu, category: category)
    visit root_path
    click_link "Menus"
  end


  scenario "user visiting main page and menu items" do
    click_link "Brunch"
    expect(page).to have_content("Carnitas Tacos")
    expect(page).to have_content("$2.00")
    expect(page).to have_content("Super awesome fried pork tacos")
  end

end
