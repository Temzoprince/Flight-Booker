class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "departure_airport_id"
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "arrival_airport_id"

  has_many :bookings
  has_many :passengers, through: :bookings

  def start_date_formatted
    start.strftime('%A, %d/%m/%Y')
  end

  def start_date_time
    start.strftime('%A, %d/%m/%Y %I:%M%p')
  end

  def duration_hours_minutes
    "#{duration/60}h #{duration % 60}min"
  end
end

