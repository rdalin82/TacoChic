require 'rails_helper'

RSpec.feature "creating a new menu" do
  before do
    visit root_path
    click_link "Menus"
    click_link "New"
  end
  scenario "a new menu" do
    expect(page).to have_content("New Menu")
    fill_in "menu_meal", with: "Fourth Meal"
    fill_in "menu_start", with: "12:00 PM"
    fill_in "menu_stop", with: "04:00 AM"
    click_button "Create Menu"
    expect(page).to have_content("Fourth Meal")
  end
  scenario "but not a duplicate menu" do
    fill_in "menu_meal", with: "Fourth Meal"
    fill_in "menu_start", with: "12:00 PM"
    fill_in "menu_stop", with: "04:00 AM"
    click_button "Create Menu"
    expect(page).to have_content("Fourth Meal")
    #dupblicate
    click_link "New"
    fill_in "menu_meal", with: "Fourth Meal"
    fill_in "menu_start", with: "12:00 PM"
    fill_in "menu_stop", with: "04:00 AM"
    click_button "Create Menu"
    expect(page).to have_content("Menu not created")
  end
end
