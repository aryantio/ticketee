require 'spec_helper'

feature "Signing up" do
  before do
  	visit '/'
  end

  scenario "Sign up successfull" do
    click_link 'Sign up'
    fill_in "Email", with: "username@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign Up"

    expect(page).to have_content("You have signed up successfully")
  end
end