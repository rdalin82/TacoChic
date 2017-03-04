require "rails_helper"

RSpec.feature "Categories update" do
  before do
    FactoryGirl.create(:category)
  end
  scenario "updating a category" do
    visit categories_path
    click_link "Edit"
    fill_in "Name", with: "Snack"
    click_button "Update Category"
    expect(page).to have_content("Snack")
  end

end
