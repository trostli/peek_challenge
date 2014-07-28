require 'awesome_print'

module Api
  class TimeslotsController < ApplicationController
    respond_to :json

    def index
      timeslots = Timeslot.all
      render json: timeslots, status: 200
    end

    def create
      timeslot = Timeslot.new(timeslot_params)
      if timeslot.save
        render json: timeslot, status: 200
      else
        render json: { errors: timeslot.errors.full_messages }, status: 400
      end
    end

    private

    def timeslot_params
      params.require(:timeslot).permit(:start_time, :duration)
    end
  end
end
