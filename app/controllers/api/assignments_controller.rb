require 'awesome_print'

module Api
  class AssignmentsController < ApplicationController
    respond_to :json

    def index
      assignments = Assignment.all
      render json: assignments, status: 200
    end

    def create
      @assignment = Assignment.new(assignment_params)
      if @assignment.save
        render json: @assignment, status: 200
      else
        render json: { errors: @assignment.errors.full_messages }, status: 400
      end
    end

    private

    def assignment_params
      params.require(:assignment).permit(:timeslot_id, :boat_id)
    end
  end
end
