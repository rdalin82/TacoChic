require "rails_helper"

RSpec.feature "Categories new" do
  before do
    @admin = FactoryGirl.create(:user, :admin)
    FactoryGirl.create(:menu)
    @user = FactoryGirl.create(:user)
    sign_in @admin
    visit menus_path
  end

  scenario "creating a new category as admin" do
    click_link "Brunch"
    click_link "New Category"
    fill_in "Name", with: "Snack"
    click_button "Create Category"
    expect(page).to have_content("Snack")
  end

end
