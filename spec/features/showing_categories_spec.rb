require "rails_helper"

RSpec.feature "Categories show" do
  before do
    FactoryGirl.create(:category)
  end
  scenario "showing each category" do
    visit categories_path
    click_link "Entre"
    expect(page).to have_content("Entre")
  end

end
