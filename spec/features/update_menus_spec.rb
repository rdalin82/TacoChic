require 'rails_helper'

RSpec.feature "updating" do
  before do
    FactoryGirl.create(:menu)
    @admin = FactoryGirl.create(:user, :admin)
  end
  scenario "an existing menu as admin" do
    sign_in @admin
    visit root_path
    click_link "Menus"
    click_link "Edit"

    fill_in "menu_meal", with: "Fourth Meal"
    fill_in "menu_start", with: "12:00 PM"
    fill_in "menu_stop", with: "04:00 AM"
    click_button "Update Menu"
    expect(page).to have_content("Fourth Meal")
  end
end
