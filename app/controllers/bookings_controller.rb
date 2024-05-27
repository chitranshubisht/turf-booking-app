class BookingsController < ApplicationController
    def new
      @facility = Facility.find(params[:facility_id])
      @booking = Booking.new
    end
  
    def create
      @facility = Facility.find(params[:facility_id])
      @booking = Booking.new(booking_params)
      @booking.user_id = current_user.id # Assuming user authentication is implemented
      
      if @booking.save
        redirect_to @facility, notice: 'Booking successful!'
      else
        render :new, alert: 'Booking failed!'
      end
    end
  
    private
  
    def booking_params
      params.require(:booking).permit(:start_time, :end_time)
    end
  end