require 'awesome_print'

module Api
  class TimeslotsController < ApplicationController
    respond_to :json

    def index
      timeslots = Timeslot.all
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

    def format_params(params)
      unix_timestamp = params[:start_time].to_i
      params[:start_time] = Time.at(unix_timestamp)
      params
    end

    def timeslot_params
      params.require(:timeslot).permit(:start_time, :duration)
    end
  end
end
