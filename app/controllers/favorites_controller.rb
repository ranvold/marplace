class FavoritesController < ApplicationController
  def index
    @cars = current_user.cars
    @cars = Kaminari.paginate_array(@cars).page(params[:page]).per(8)
  end

  def update
    favorite = Favorite.where(car: Car.find(params[:id]), user: current_user)
    
    if favorite == []
      Favorite.create(car: Car.find(params[:id]), user: current_user)
      @favorite_exists = true
    else
      favorite.destroy_all
      @favorite_exists = false
    end
  end
end
