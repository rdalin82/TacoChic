require "rails_helper"

RSpec.feature "Categories update" do
  before do
    @admin = FactoryGirl.create(:user, :admin)
    menu = FactoryGirl.create(:menu)
    FactoryGirl.create(:category, menu: menu)
  end
  scenario "updating a category as admin" do
    sign_in @admin
    visit menus_path
    click_link "Brunch"
    click_link "Entre"
    click_link "Edit"
    fill_in "Name", with: "Snack"
    click_button "Update Category"
    expect(page).to have_content("Snack")
  end

end
