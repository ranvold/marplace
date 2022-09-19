class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params.merge(model_id: params[:model_id]))

    @car.name = Car.car_name(@car, params[:submodel_id])

    if @car.save
      redirect_to @car, notice: "Car was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if !params[:model_id].nil?
      @car.model_id = params[:model_id]
      @car.name = Car.car_name(@car, params[:submodel_id])
    end

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

    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:name, :fueltype, :bodycolor, :gearbox, :price, :model_id, :dealer_id)
    end
end
