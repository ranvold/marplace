class DealersController < ApplicationController
  before_action :set_dealer, only: %i[ show edit update destroy ]

  # GET /dealers
  def index
    @dealers = Dealer.all
  end

  # GET /dealers/1
  def show
  end

  # GET /dealers/new
  def new
    @dealer = Dealer.new
  end

  # GET /dealers/1/edit
  def edit
  end

  # POST /dealers
  def create
    @dealer = Dealer.new(dealer_params)

    if @dealer.save
      redirect_to @dealer, notice: "Dealer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dealers/1
  def update
    if @dealer.update(dealer_params)
      redirect_to @dealer, notice: "Dealer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /dealers/1
  def destroy
    @dealer.destroy
    redirect_to dealers_url, notice: "Dealer was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dealer
      @dealer = Dealer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dealer_params
      params.require(:dealer).permit(:name)
    end
end
