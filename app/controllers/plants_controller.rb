class PlantsController < ApplicationController
    wrap_parameters format: []

    def index
        render json: Plant.all, status:
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, status:
        else
            render json: { error: "Not Found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(plant_parameters)
        render json: plant, status: :created
    end

    private

    def plant_parameters
        params.permit(:name, :image, :price)
    end
end
