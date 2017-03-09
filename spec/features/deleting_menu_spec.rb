require "rails_helper"

RSpec.feature "Deleting Menus" do
  before do
    FactoryGirl.create(:menu)
    @admin = FactoryGirl.create(:user, :admin)
  end

  scenario "by clicking delete" do
    sign_in @admin
    visit root_path
    click_link "Menus"
    click_link "Delete"
    expect(page).to_not have_content("Brunch")
  end
end
