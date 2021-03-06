module Api
  class BookingsController < ApplicationController
    respond_to :json

    def index
      bookings = Booking.all
      render json: bookings, status: 200
    end

    def create
      @booking = Booking.new(booking_params)
      if @booking.save
        render json: @booking, status: 200
      else
        render json: { errors: @booking.errors.full_messages }, status: 400
      end
    end

    private

    def booking_params
      params.require(:booking).permit(:timeslot_id, :size)
    end
  end
end
