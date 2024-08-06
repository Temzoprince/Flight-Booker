# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airports = {
  0 => {
    :name => 'London Heathrow',
    :code => 'LHR',
    :city => 'London',
    :country => 'UK'
  },
  1 => {
    :name => 'London Gatwick',
    :code => 'LGW',
    :city => 'London',
    :country => 'UK'
  },
  2 => {
    :name => 'Manchester',
    :code => 'MAN',
    :city => 'Manchester',
    :country => 'UK'
  },
  3 => {
    :name => 'Los Angeles International',
    :code => 'LAX',
    :city => 'Los Angeles',
    :country => 'USA'
  },
  4 => {
    :name => 'Denver International',
    :code => 'DEN',
    :city => 'Denver',
    :country => 'USA'
  },
  5 => {
    :name => 'John F Kennedy',
    :code => 'JFK',
    :city => 'New York',
    :country => 'USA'
  }
}

airports.each_value do |airport|
  Airport.create_or_find_by(code: airport[:code],
                            name: airport[:name],
                            city: airport[:city],
                            country: airport[:country])
end

flights = {
  0 => {
    :start => Date.strptime("04-Aug-24", "%d-%b-%y"),
    :duration => 675,
    :departure_airport => Airport.find_by(code: 'LHR'),
    :arrival_airport => Airport.find_by(code: 'LAX')
  },
  1 => {
    :start => Date.strptime("02-Aug-24", "%d-%b-%y"),
    :duration => 230,
    :departure_airport => Airport.find_by(code: 'LGW'),
    :arrival_airport => Airport.find_by(code: 'MAN')
  },
  2 => {
    :start => Date.strptime("08-Aug-24", "%d-%b-%y"),
    :duration => 240,
    :departure_airport => Airport.find_by(code: 'DEN'),
    :arrival_airport => Airport.find_by(code: 'JFK')
  }
}

flights.each_value do |flight|
  Flight.create_or_find_by(start: flight[:start],
                           duration: flight[:duration],
                           departure_airport: flight[:departure_airport],
                           arrival_airport: flight[:arrival_airport])
end
