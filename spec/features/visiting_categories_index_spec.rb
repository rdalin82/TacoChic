require "rails_helper"

RSpec.feature "Categories Index" do
  before do
    FactoryGirl.create(:category)
  end
  scenario "visiting the categories index" do
    visit categories_path
    expect(page).to have_content("Entre")
  end

end
