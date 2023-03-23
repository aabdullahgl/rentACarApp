module Api
  class CarsController < ApplicationController
    before_action :set_car, only: [:show, :update, :destroy]

  def index
    @cars= Car.all
    if (defined? @cars)
      render json: @cars, status: :ok
    else
      render json: {
        error: "error get all cars"
      },
      status: 404
    end
  end

  def show
    if (defined? @car)
      render :show,status: :ok
    else
      render json: {
        error: "error get by car"
      },
      status: 404
    end
  end

  def create
    @car=Car.new(car_params)
    if (@car.save)
      render :show, status: 201
    else
      render json: {
        error: "error created car"
      },
      status: :bad_request
    end
  end

  def update
    if (@car.update(car_params))
      render :show, status: :ok
    else
      redner json: {
        error: "error updated car"
      },
      status: :bad_request
    end
  end

  def destroy
    if (@car.destroy)
      redner json: {
        message: "success deleted car",
        data: :show
      },
      status: :ok
    else
      render json: {
        error:"error deleted car"
      },
      status: :bad_request
    end
  end



  private

  def set_car
    @car= Car.find_by(id: params[:id])
  end

  def car_params
    params.require(:car).permit(:daily_price,:model_year,:status,:model_id)
  end

  end
end

