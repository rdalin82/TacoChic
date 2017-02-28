require 'rails_helper'

RSpec.feature "creating" do
  before do
    FactoryGirl.create(:menu)
    visit root_path
    click_link "Menus"
    click_link "Brunch"
    click_link "New Item"
  end

  scenario "a new menue item" do
    fill_in "Name", with: "Super Sized Carnitas"
    fill_in "Description", with: "Even bigger!"
    fill_in "Price", with: "2.55"
    click_button "Create Item"
    expect(page).to have_content "Super Sized Carnitas"
  end
end
