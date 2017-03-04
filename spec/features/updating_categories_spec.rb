require "rails_helper"

RSpec.feature "Categories update" do
  before do
    menu = FactoryGirl.create(:menu)
    FactoryGirl.create(:category, menu: menu)
  end
  scenario "updating a category" do
    visit menus_path
    click_link "Brunch"
    click_link "Entre"
    click_link "Edit"
    fill_in "Name", with: "Snack"
    click_button "Update Category"
    expect(page).to have_content("Snack")
  end

end
