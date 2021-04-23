require 'rails_helper'

RSpec.describe Airline, type: :model do
  it {should have_many :flights}

  before(:each) do
    @passenger_1 = Passenger.create!(name: "Passenger_1", age: 20)
    @passenger_2 = Passenger.create!(name: "Passenger_2", age: 30)
    @passenger_3 = Passenger.create!(name: "Passenger_3", age: 25)
    @passenger_4 = Passenger.create!(name: "Passenger_4", age: 16)
    @passenger_5 = Passenger.create!(name: "Passenger_5", age: 50)
    @passenger_6 = Passenger.create!(name: "Passenger_6", age: 42)

    @airline_1 = Airline.create!(name: "Universe Gliders")
    @airline_2 = Airline.create!(name: "Average Airplanes")

    @flight_1 = @airline_1.flights.create!(number: "UG_1", date: "04/18/19", departure_city: "DCity_1", arrival_city: "ACity_1")
    @flight_2 = @airline_2.flights.create!(number: "UG_2", date: "04/19/19", departure_city: "DCity_2", arrival_city: "ACity_2")

    @flight_6 = @airline_2.flights.create!(number: "AA_6", date: "11/29/19", departure_city: "DCity_1", arrival_city: "ACity_1")

    @flight_9 = @airline_1.flights.create!(number: "UG_6", date: "06/29/19", departure_city: "DCity_4", arrival_city: "ACity_4")


    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_1.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_2.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_3.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_4.id)
    FlightPassenger.create(flight_id: @flight_1.id, passenger_id: @passenger_5.id)

    FlightPassenger.create(flight_id: @flight_2.id, passenger_id: @passenger_1.id)
    FlightPassenger.create(flight_id: @flight_6.id, passenger_id: @passenger_5.id)
    FlightPassenger.create(flight_id: @flight_9.id, passenger_id: @passenger_4.id)
  end

  describe "instance methods" do
    describe "#passenger_list" do
      it "lists unique names of adult passengers that have flights on that airline" do
        expected = [@passenger_1.name, @passenger_2.name, @passenger_3.name, @passenger_5.name]

        expect(@airline_1.passenger_list).to eq(expected)
      end
    end
  end
end
