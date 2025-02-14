require 'rails_helper'

RSpec.describe 'the airline show page' do
  before(:each) do
    @passenger_1 = Passenger.create!(name: "Passenger_1", age: 20)
    @passenger_2 = Passenger.create!(name: "Passenger_2", age: 30)
    @passenger_3 = Passenger.create!(name: "Passenger_3", age: 25)
    @passenger_4 = Passenger.create!(name: "Passenger_4", age: 50)
    @passenger_5 = Passenger.create!(name: "Passenger_5", age: 16)
    @passenger_6 = Passenger.create!(name: "Passenger_6", age: 42)

    @airline_1 = Airline.create!(name: "Universe Gliders")
    @airline_2 = Airline.create!(name: "Average Airplanes")

    @flight_1 = @airline_1.flights.create!(number: "UG_1", date: "04/18/19", departure_city: "DCity_1", arrival_city: "ACity_1")
    @flight_5 = @airline_1.flights.create!(number: "UG_5", date: "08/29/19", departure_city: "DCity_5", arrival_city: "ACity_5")
    @flight_9 = @airline_1.flights.create!(number: "UG_6", date: "06/29/19", departure_city: "DCity_4", arrival_city: "ACity_4")

    @flight_2 = @airline_2.flights.create!(number: "UG_2", date: "04/19/19", departure_city: "DCity_2", arrival_city: "ACity_2")
    @flight_6 = @airline_2.flights.create!(number: "AA_6", date: "11/29/19", departure_city: "DCity_1", arrival_city: "ACity_1")
    @flight_10 = @airline_2.flights.create!(number: "AA_6", date: "05/29/19", departure_city: "DCity_5", arrival_city: "ACity_5")

    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_3.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_4.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_5.id)

    FlightPassenger.create(flight_id: @flight_5.id, passenger_id: @passenger_4.id)
    FlightPassenger.create(flight_id: @flight_9.id, passenger_id: @passenger_4.id)
    FlightPassenger.create(flight_id: @flight_9.id, passenger_id: @passenger_3.id)


    visit airline_path(@airline_1)
  end

  it "shows the airline's name" do
    expect(page).to have_content(@airline_1.name)
    expect(page).to_not have_content(@airline_2.name)
  end

  describe "it lists the names of passengers that have flights on that airline" do
    it "has a list of unique names including only adult passengers (age 18 and up)" do
      within "#passengers" do
        expect(page).to have_content(@passenger_1.name)
        expect(page).to have_content(@passenger_2.name)
        expect(page).to have_content(@passenger_3.name)
        expect(page).to have_content(@passenger_4.name)

        expect(page).to_not have_content(@passenger_5.name)
        expect(page).to_not have_content(@passenger_5.name)
      end
    end
  end

  #EXTENSION
  describe "it has a section 'Frequent Fliers'" do
    xit "lists the adult passengers by number of flights, most to least" do
      within "#frequent" do
        expect(@passenger_4.name).to appear_before(@passenger_3.name)
        expect(@passenger_3.name).to appear_before(@passenger_1.name)
        expect(@passenger_1.name).to appear_before(@passenger_2.name)
      end
    end
  end
end
