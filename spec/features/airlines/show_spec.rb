require 'rails_helper'

RSpec.describe 'the airline show page' do
  before(:each) do
    # add objects

    visit airline_path(@airline_1)
  end

  it "shows the airline's name" do
    expect(page).to have_content(@airline_1.name)
    expect(page).to_not have_content(@airline_2.name)
  end


  it "displays names and descriptions of that airline's dishes" do
    within "#dishes" do
      expect(page).to have_content(@flight_1.name)
      expect(page).to have_content(@flight_1.description)
      expect(page).to have_content(@flight_2.name)
      expect(page).to have_content(@flight_2.description)

      expect(page).to_not have_content(@flight_3.name)
      expect(page).to_not have_content(@flight_3.description)
    end
  end

  describe "it lists the names of passengers that have flights on that airline" do
    it "has a list of unique names including only adult passengers (age 18 and up)" do
      within "#passengers" do
        expect(page).to have_content(@passenger_1.name)


        expect(page).to_not have_content(@passenger_5.name)

      end
    end
  end

  # EXTENSION
  # describe "it has a section 'Frequent Fliers'" do
  #   it "lists the adult passengers by number of flights, most to least" do
  #     flight_4 = @airline_1.flights.create!(name: )
  #     flight_5 = @airline_1.flights.create!(name: )
  #     FlightPassenger.create(flight_id: flight_4.id, passenger_id: @passenger_3.id)
  #     FlightPassenger.create(flight_id: flight_5.id, passenger_id: @passenger_4.id)
  #
  #     within "#frequent" do
  #       expect(@passenger_3.name).to appear_before(@passenger_1.name)
  #       expect(@passenger_1.name).to appear_before(@passenger_2.name)
  #
  #       expect(page).to_not have_content(@passenger_4.name)
  #     end
  #   end
  end
end
