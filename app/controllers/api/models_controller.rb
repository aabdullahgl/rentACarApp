module Api
  class ModelsController < ApplicationController

    before_action :set_model, only: [:show, :destroy, :update]
  def index
    @models= Model.all
    if(defined? @models)
      render json: @models, status: :ok
    else
      render json:{
        error:"error get all model"
      },
      status: 404
    end
  end

  def create
    @model= Model.new(model_params)
    if (@model.save)
      render :show, status: 201
    else
      render json:{
        error:"error create model"
      },
      status: :bad_request
    end
  end

  def show
    if (defined? @model)
      render :show,status: :ok
    else
      render json: {
        error: "error get by model"
      },
      status: 404
    end
  end

  def update
    if (@model.update(model_params))
      render :show,status: :ok
    else
      render json: {
        error: "error updated model"
      },
      status: :bad_request
    end
  end

  def destroy
    if (@model.destroy)
      redner json:{
        message: "success deleted model",
        data: :show
      },
      status: :ok
    else
      render json:{
        error:"error deleted model"
      },
      status: :bad_request
    end
  end


  private

  def model_params
    params.require(:model).permit(:name, :brand_id)
  end

  def set_model
    @model= Model.find_by(id: params[:id])
  end

  end
end

