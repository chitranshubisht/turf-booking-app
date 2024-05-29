# app/models/facility.rb
class Facility < ApplicationRecord
  has_many :bookings
  def booked_slots
    bookings.count
  end
end
