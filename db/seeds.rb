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
