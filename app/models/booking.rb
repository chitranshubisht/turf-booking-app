class Booking < ApplicationRecord
    belongs_to :facility
    belongs_to :user
  
    validate :validate_time_slot_availability
  
    private
  
    def validate_time_slot_availability
      if Booking.exists?(facility_id: facility_id, start_time: start_time..end_time)
        errors.add(:base, 'This time slot is not available')
      end
    end
  end