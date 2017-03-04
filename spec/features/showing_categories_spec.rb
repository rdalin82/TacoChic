require "rails_helper"

RSpec.feature "Categories show" do
  before do
    menu = FactoryGirl.create(:menu)
    FactoryGirl.create(:category, menu: menu)
  end
  scenario "showing each category" do
    visit menus_path
    click_link "Brunch"
    click_link "Entre"
    expect(page).to have_content("Entre")
  end

end
