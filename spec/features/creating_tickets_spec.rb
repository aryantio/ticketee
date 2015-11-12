require 'spec_helper'

feature 'Creating ticket' do
  before do 
    FactoryGirl.create(:project, name: "Internet Explorer")

    visit '/'
	click_link "Internet Explorer"
	click_link "New Ticket"
  end

  scenario 'Creating a ticket' do
  	fill_in "Title", with: "Non-standard complience"
  	fill_in "Description", with: "My Pages are ugly!"
  	click_button "Create Ticket"

  	expect(page).to have_content("Ticket has been created.")
  end

  scenario 'Creating Ticket without valid attributes' do 
    click_button "Create Ticket"

    expect(page).to have_content("Ticket has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end