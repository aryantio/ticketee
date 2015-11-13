require 'spec_helper'

feature "Viewing Tickets" do
  before do
    user = FactoryGirl.create(:user)
    textmate_2 = FactoryGirl.create(:project, name: "TextMate 2")
    ticket = FactoryGirl.create(:ticket, project: textmate_2, title:"Make it shiny!", description: "Gradients! Starbursts! Oh my!")
    ticket.update(user: user)
    
    visit '/'
  end

  scenario "View the ticket for a given project" do
  	click_link "TextMate 2"

  	expect(page).to have_content("Make it shiny!")
  	expect(page).to_not have_content("Standart Complience")

  	click_link("Make it shiny!")
  	within("#ticket h2") do
  	  expect(page).to have_content("Make it shiny!")
  	end

  	expect(page).to have_content("Gradients! Starbursts! Oh my!")
  end
end


