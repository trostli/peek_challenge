module Api
  class BoatsController < ApplicationController
    respond_to :json

    def index
      boats = Boat.all
      render json: boats, status: 200
    end

    def create
      boat = Boat.new(boat_params)
      if boat.save
        render json: boat, status: 200
      else
        render json: { errors: boat.errors.full_messages }, status: 400
      end
    end

    private

    def boat_params
      params.require(:boat).permit(:name, :capacity)
    end
  end
end
