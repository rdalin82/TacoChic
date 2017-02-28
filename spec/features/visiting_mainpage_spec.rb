require 'rails_helper'

RSpec.feature "Users visiting the main page" do
  scenario "user visiting the main page" do
    visit "/"
    expect(page).to have_content("Welcome to Taco Chic")
  end
end
