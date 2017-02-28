require 'rails_helper'

RSpec.feature "Viewing Menus" do
  before do
    FactoryGirl.create(:menu)
  end
  scenario "navigating from main page to view a menu" do
    visit "/"
    click_link "Menus"
    click_link "Brunch"
    expect(page).to have_content "Brunch Menu"
    expect(page).to have_content "09:00 AM - 11:00 AM"
  end
end
