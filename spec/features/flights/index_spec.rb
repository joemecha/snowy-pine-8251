require 'rails_helper'

RSpec.describe 'flights index page' do
  before(:each) do

    visit '/flights'
  end

  it "displays a list of all the flight numbers and the name of the airline next to each one" do
      expect(page).to have_content()
      expect(page).to_not have_content()
  end
  it "under each flight, it displays the names of all that flight's passengers" do
  end

  xit "next to each passenger, it has a button to remove that passenger from the flight" do
    within("#passenger-#{@passenger_1.id}") do
      click_button "Remove Passenger"

      item = Item.find(@item_1.id)
      expect(item.status).to eq("disabled")
    end
  end
end
