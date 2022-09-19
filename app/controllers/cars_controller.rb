class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :get_models, only: %i[ new edit ]
  before_action :get_submodels, only: %i[ new edit ]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
    @models = []
    @submodels = []
  end

  def edit
    @models = []
    @submodels = []
  end

  def create
    @car = Car.new(car_params.merge(model_id: params[:model_id]))

    if @car.save
      redirect_to @car, notice: "Car was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @car.model_id = params[:model_id]

    if @car.update(car_params)
      redirect_to @car, notice: "Car was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_url, notice: "Car was successfully destroyed."
  end

  private

  def get_models
    if params[:brand_id].present? && params[:model_id].nil?
      @models = Brand.find(params[:brand_id]).models

      if request.xhr?
        respond_to do |format|
          format.json {
            render json: {models: @models}
          }
        end
      end
    end
  end

  def get_submodels
    if params[:model_id]
      @submodels = Submodel.where(model_id: params[:model_id])

      if request.xhr?
        respond_to do |format|
          format.json {
            render json: {submodels: @submodels}
          }
        end
      end
    end
  end

    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:name, :fueltype, :bodycolor, :gearbox, :price, :model_id, :dealer_id)
    end
end
