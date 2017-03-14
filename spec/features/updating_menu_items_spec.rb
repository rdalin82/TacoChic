require 'rails_helper'

RSpec.describe "updating individual menu items" do
  before do
    @admin = FactoryGirl.create(:user, :admin)
    menu = FactoryGirl.create(:menu)
    category = FactoryGirl.create(:category, menu: menu)
    @item = FactoryGirl.create(:item, menu: menu, category: category)
    sign_in @admin
    visit root_path
    click_link "Menus"
    click_link "Brunch"
  end

  scenario "with new information as admin" do
    click_link "Edit"
    fill_in "Name", with: "Super Sized Carnitas"
    fill_in "Price", with: "2.55"
    click_button "Update Item"
    expect(page).to have_content "Super Sized Carnitas"
  end
end
