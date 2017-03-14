require 'rails_helper'

RSpec.describe "showing individual menu items" do
  before do
    menu = FactoryGirl.create(:menu)
    category = FactoryGirl.create(:category, menu: menu)
    @item = FactoryGirl.create(:item, menu: menu, category: category)
    user = FactoryGirl.create(:user, :admin)
    sign_in(user) 
    visit root_path
    click_link "Menus"
    click_link "Brunch"
  end

  scenario "clicking on individual menu items" do
    click_link "Show"
    expect(page).to have_content("Carnitas Tacos")
    expect(page).to have_link("Back")
  end
end
