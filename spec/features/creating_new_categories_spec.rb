require "rails_helper"

RSpec.feature "Categories new" do

  scenario "updating a category" do
    visit categories_path
    click_link "New"
    fill_in "Name", with: "Snack"
    click_button "Create Category"
    expect(page).to have_content("Snack")
  end

end
