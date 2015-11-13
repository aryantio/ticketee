require 'spec_helper'

feature "Editing tickets" do
  let!(:project) {FactoryGirl.create(:project)}
  let!(:user) {FactoryGirl.create(:user)}
  let!(:ticket) do
    ticket = FactoryGirl.create(:ticket, project: project)
    ticket.update(user: user)
    ticket
  end

  before do 
    sign_in_as!(user)
  	visit '/'
  	click_link project.name
  	click_link ticket.title
  	click_link "Edit Ticket"
  end

  scenario "Updating a ticket" do
    fill_in "Title", with: "Internet Explorer"
    click_button "Update Ticket"

    expect(page).to have_content "Ticket has been updated."

    within("#ticket h2") do
      expect(page).to have_content "Internet Explorer"
    end

    expect(page).to have_content ticket.title
  end

  scenario "Updating ticket invalid information" do
  	fill_in "Title", with: ""
  	click_button "Update Ticket"

  	expect(page).to have_content "Ticket has not been updated."
  end
end