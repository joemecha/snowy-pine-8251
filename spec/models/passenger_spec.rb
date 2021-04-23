require 'rails_helper'

RSpec.describe Passenger, type: :model do
  before(:each) do
    @passenger_1 = Passenger.create!(name: "Passenger_1", age: 22)

    @passenger_2 = Passenger.create!(name: "Passenger_2", age: 30)

    @airline_1 = Airline.create!(name: "Universe Gliders")
    @airline_2 = Airline.create!(name: "Average Airplanes")
    @airline_3 = Airline.create!(name: "Frontear")
    @airline_4 = Airline.create!(name: "All Nice Airline")

    @flight_1 = @airline_1.flights.create!(number: "UG_1", date: "04/18/19", departure_city: "DCity_1", arrival_city: "ACity_1")
    @flight_2 = @airline_2.flights.create!(number: "UG_2", date: "04/19/19", departure_city: "DCity_2", arrival_city: "ACity_2")
    @flight_3 = @airline_3.flights.create!(number: "UG_3", date: "04/20/19", departure_city: "DCity_2", arrival_city: "ACity_2")
    @flight_4 = @airline_4.flights.create!(number: "UG_4", date: "05/28/19", departure_city: "DCity_4", arrival_city: "ACity_4")
    @flight_5 = @airline_1.flights.create!(number: "UG_6", date: "08/29/19", departure_city: "DCity_5", arrival_city: "ACity_5")

    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
    FlightPassenger.create(flight_id: @flight_2.id, passenger_id: @passenger_1.id)
    FlightPassenger.create(flight_id: @flight_3.id, passenger_id: @passenger_2.id)
    FlightPassenger.create(flight_id: @flight_4.id, passenger_id: @passenger_2.id)
    FlightPassenger.create(flight_id: @flight_5.id, passenger_id: @passenger_1.id)
  end

  describe "relationships" do
    it {should have_many :flight_passengers}
    it {should have_many(:flights).through(:flight_passengers)}
  end
end
