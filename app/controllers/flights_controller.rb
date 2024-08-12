class FlightsController < ApplicationController
  def index
    # @departing_airports = Flight.all.map{ |flight| [ flight.name, flight.id ] }
    @flights = Flight.all
    @available_flights = Flight.where(
                                  'departure_airport_id = ? AND
                                   arrival_airport_id = ? AND
                                   DATE(start) = ?',
                                   params[:departure_airport_id],
                                   params[:arrival_airport_id],
                                   params[:start])
  end

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :start)
  end
end
