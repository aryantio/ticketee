require 'spec_helper'

feature "Viewing Tickets" do
  before do
  	textmate_2 = FactoryGirl.create(:project, name: "TextMate 2")
  	FactoryGirl.create(:ticket, project: textmate_2, title: "Make it shiny!", description: "Gradients !, Starburst ! Oh My !")

    internet_explorer = FactoryGirl.create(:project, name: "Internet Explorer")
    FactoryGirl.create(:ticket, project:internet_explorer, title:"Standart Complience", description: "it isn't a joke")
    
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

  	expect(page).to have_content("Gradients !, Starburst ! Oh My !")
  end
end


