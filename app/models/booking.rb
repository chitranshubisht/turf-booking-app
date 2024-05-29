class Booking < ApplicationRecord
  belongs_to :facility
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true

  validate :validate_time_slot_availability

  private

  def validate_time_slot_availability
    if Booking.exists?(
      facility_id:,
      start_time: start_time...end_time
    )
      errors.add(:base, 'This time slot overlaps with an existing booking')
    end
  end
end
