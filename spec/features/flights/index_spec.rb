require 'rails_helper'

RSpec.describe 'flights index page' do
  before(:each) do
    before(:each) do
      @passenger_1 = Passenger.create!(name: "Passenger_1", age: 20)
      @passenger_2 = Passenger.create!(name: "Passenger_2", age: 30)
      @passenger_3 = Passenger.create!(name: "Passenger_3", age: 25)
      @passenger_4 = Passenger.create!(name: "Passenger_4", age: 50)
      @passenger_5 = Passenger.create!(name: "Passenger_5", age: 16)

      @airline_1 = Airline.create!(name: "Universe Gliders")
      @airline_2 = Airline.create!(name: "Average Airplanes")
      @airline_3 = Airline.create!(name: "Frontear")
      @airline_4 = Airline.create!(name: "All Nice Airline")

      @flight_1 = @airline_1.flights.create!(number: "UG_1", date: "04/18/19", departure_city: "DCity_1", arrival_city: "ACity_1")
      @flight_2 = @airline_2.flights.create!(number: "AA_2", date: "04/19/19", departure_city: "DCity_2", arrival_city: "ACity_2")
      @flight_3 = @airline_3.flights.create!(number: "FT_3", date: "04/20/19", departure_city: "DCity_2", arrival_city: "ACity_2")
      @flight_4 = @airline_4.flights.create!(number: "ANA_4", date: "05/28/19", departure_city: "DCity_4", arrival_city: "ACity_4")
      @flight_5 = @airline_1.flights.create!(number: "UG_5", date: "08/29/19", departure_city: "DCity_5", arrival_city: "ACity_5")

      @flight_6 = @airline_2.flights.create!(number: "AA_6", date: "11/29/19", departure_city: "DCity_1", arrival_city: "ACity_1")
      @flight_7 = @airline_3.flights.create!(number: "FT_6", date: "10/29/19", departure_city: "DCity_2", arrival_city: "ACity_2")
      @flight_8 = @airline_4.flights.create!(number: "ANA_6", date: "09/29/19", departure_city: "DCity_3", arrival_city: "ACity_3")
      @flight_9 = @airline_1.flights.create!(number: "UG_6", date: "06/29/19", departure_city: "DCity_4", arrival_city: "ACity_4")
      @flight_10 = @airline_2.flights.create!(number: "AA_6", date: "05/29/19", departure_city: "DCity_5", arrival_city: "ACity_5")

      FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
      FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
      FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_3.id)
      FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_4.id)
      FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_5.id)

      FlightPassenger.create(flight_id: @flight_2.id, passenger_id: @passenger_1.id)
      FlightPassenger.create(flight_id: @flight_3.id, passenger_id: @passenger_2.id)
      FlightPassenger.create(flight_id: @flight_4.id, passenger_id: @passenger_3.id)
      FlightPassenger.create(flight_id: @flight_5.id, passenger_id: @passenger_4.id)

      FlightPassenger.create(flight_id: @flight_6.id, passenger_id: @passenger_5.id)
      FlightPassenger.create(flight_id: @flight_7.id, passenger_id: @passenger_2.id)
      FlightPassenger.create(flight_id: @flight_8.id, passenger_id: @passenger_3.id)
      FlightPassenger.create(flight_id: @flight_9.id, passenger_id: @passenger_4.id)
      FlightPassenger.create(flight_id: @flight_10.id, passenger_id: @passenger_5.id)
    end

    visit '/flights'
  end

  it "displays a list of all the flight numbers and the name of the airline next to each one" do
      expect(page).to have_content(@flight_1.number)
      expect(page).to have_content(@flight_1.airline.name)
      expect(page).to have_content(@flight_2.number)
      expect(page).to have_content(@flight_2.airline.name)
      expect(page).to have_content(@flight_3.number)
      expect(page).to have_content(@flight_3.airline.name)
      expect(page).to have_content(@flight_4.number)
      expect(page).to have_content(@flight_4.airline.name)
      expect(page).to have_content(@flight_5.number)
      expect(page).to have_content(@flight_5.airline.name)
      expect(page).to have_content(@flight_6.number)
      expect(page).to have_content(@flight_6.airline.name)
      expect(page).to have_content(@flight_7.number)
      expect(page).to have_content(@flight_7.airline.name)
      expect(page).to have_content(@flight_8.number)
      expect(page).to have_content(@flight_8.airline.name)
      expect(page).to have_content(@flight_9.number)
      expect(page).to have_content(@flight_9.airline.name)
      expect(page).to have_content(@flight_10.number)
      expect(page).to have_content(@flight_10.airline.name)
  end

  xit "under each flight, it displays the names of all that flight's passengers" do
  end

  xit "next to each passenger, it has a button to remove that passenger from the flight" do
    within("#passenger-#{@passenger_1.id}") do
      expect(page).to have_content()

      click_button "Remove Passenger"

      expect(page).to_not have_content()
    end
  end
end
