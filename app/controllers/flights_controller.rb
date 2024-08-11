class FlightsController < ApplicationController
  def index
    # @departing_airports = Flight.all.map{ |flight| [ flight.name, flight.id ] }
    @flights = Flight.all
  end
end
