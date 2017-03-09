require 'rails_helper'

RSpec.describe "deleting individual menu items" do
  before do
    @admin = FactoryGirl.create(:user, :admin)
    menu = FactoryGirl.create(:menu)
    category = FactoryGirl.create(:category, menu: menu)
    @item = FactoryGirl.create(:item, menu: menu, category: category)
    visit root_path
    click_link "Menus"
    click_link "Brunch"

  end

  scenario "by clicking as admin" do
    sign_in @admin
    click_link "Delete"
    expect(page).not_to have_content "Carnitas"
  end
end
