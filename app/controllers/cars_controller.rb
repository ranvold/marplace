class CarsController < ApplicationController
  before_action :authenticate_seller!, only: %i[ new create edit update destroy ]
  before_action :show_access, only: [:show]
  before_action :set_car, only: %i[ show edit update destroy ]

  def index
    @cars = Car.all
    @cars = Kaminari.paginate_array(@cars).page(params[:page]).per(8)
  end

  def show
    @favorite_exists = Favorite.where(car: Car.find(params[:id]), user: current_user) == [] ? false : true
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
    redirect_to cars_url, notice: "Car was successfully deleted."
  end

  private

    def set_car
      @car = Car.find(params[:id])
    end

    def show_access
      unless user_signed_in? || seller_signed_in?
        flash[:alert] = "You must be logged in to access this section"
        redirect_to root_path
      end
    end


    def car_params
      params.require(:car).permit(:name, :fuel_type, :body_color, :gearbox, :price, :model_id, :dealer_id, images: [])
    end
end
