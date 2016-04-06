require "rails_helper"

RSpec.feature "User login", :type => :feature do
  before :each do
    Fabricate(:user, email: "user1@mart.com")
  end

  scenario "User login successfull " do
    visit "/users/sign_in"

    fill_in "Email", :with => "user1@mart.com"
    fill_in "Password", :with => "123456a@"
    click_button "Sign in"

    expect(page).to have_text("Signed in successfully.")
  end

  scenario "User login failed " do
    visit "/users/sign_in"

    fill_in "Email", :with => "user1@mart.com"
    fill_in "Password", :with => "123456"
    click_button "Sign in"

    expect(page).to have_text("Invalid email or password.")
  end
end