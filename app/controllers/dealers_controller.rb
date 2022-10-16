class DealersController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_dealer, only: %i[show edit update destroy]

  def index
    @dealers = Dealer.all
  end

  def show; end

  def new
    @dealer = Dealer.new
  end

  def edit; end

  def create
    @dealer = Dealer.new(dealer_params)

    if @dealer.save
      redirect_to @dealer, notice: 'Dealer was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @dealer.update(dealer_params)
      redirect_to @dealer, notice: 'Dealer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dealer.destroy
    redirect_to dealers_url, notice: 'Dealer was successfully destroyed.'
  end

  private

  def set_dealer
    @dealer = Dealer.find(params[:id])
  end

  def dealer_params
    params.require(:dealer).permit(:name)
  end
end
