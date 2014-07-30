require 'awesome_print'
require 'time'

module Api
  class TimeslotsController < ApplicationController
    respond_to :json

    def index
      update_timeslots(Timeslot.all)
      if (params[:timeslot][:date])
        beginning_of_queried_date_timestamp = Time.parse(params[:timeslot][:date]).to_i
        end_of_queried_date_timestamp = beginning_of_queried_date_timestamp + 86400

        timeslots = Timeslot.where("start_time >= :start_date AND start_time <= :end_date", {start_date: beginning_of_queried_date_timestamp, end_date: end_of_queried_date_timestamp})
      else
        timeslots = Timeslot.all
      end
      render json: timeslots, status: 200
    end

    def create
      formatted_params = format_params(timeslot_params)
      timeslot = Timeslot.new(formatted_params)
      if timeslot.save
        render json: timeslot, status: 200
      else
        render json: { errors: timeslot.errors.full_messages }, status: 400
      end
    end

    private

    def update_timeslots(timeslots)

      timeslots.each do |timeslot|
        if timeslot.boats != []
          available_boats = timeslot.boats
          available_boats = available_boats.sort_by { |boat| boat.capacity }
          boat_capacities = available_boats.map { |boat| boat.capacity }
          timeslot.availability = boat_capacities[-1]

          timeslot.bookings.each do |booking|
            boat_capacities[-1] -= booking.size
            boat_capacities.sort!
            timeslot.availability = boat_capacities[-1]
            timeslot.customer_count += booking.size
          end
        end
        timeslot.save
      end
    end

    def format_params(params)
      params[:start_time] = params[:start_time].to_i
      params[:duration] = params[:duration].to_i
      params
    end

    def timeslot_params
      params.require(:timeslot).permit(:start_time, :duration)
    end
  end
end
