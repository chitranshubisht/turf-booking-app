class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :set_facility, only: %i[new create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = @facility.bookings.build(booking_params)
    @booking.user = current_user

    respond_to do |format|
      if @booking.save
        format.json { render json: { success: true } }
      else
        format.json { render json: { success: false, errors: @booking.errors.full_messages } }
      end
    end
  end

  private

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
