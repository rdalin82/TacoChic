require "rails_helper"

RSpec.feature "Categories new" do
  before do
    FactoryGirl.create(:menu)
  end
  scenario "creating a new category" do
    visit menus_path
    click_link "Brunch"
    click_link "New Category"
    fill_in "Name", with: "Snack"
    click_button "Create Category"
    expect(page).to have_content("Snack")
  end

end
