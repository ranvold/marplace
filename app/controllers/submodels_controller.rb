class SubmodelsController < ApplicationController
  before_action :set_submodel, only: %i[ show edit update destroy ]

  # GET /submodels
  def index
    @submodels = Submodel.all
  end

  # GET /submodels/1
  def show
  end

  # GET /submodels/new
  def new
    @submodel = Submodel.new
  end

  # GET /submodels/1/edit
  def edit
  end

  # POST /submodels
  def create
    @submodel = Submodel.new(submodel_params)

    if @submodel.save
      redirect_to @submodel, notice: "Submodel was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /submodels/1
  def update
    if @submodel.update(submodel_params)
      redirect_to @submodel, notice: "Submodel was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /submodels/1
  def destroy
    @submodel.destroy
    redirect_to submodels_url, notice: "Submodel was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submodel
      @submodel = Submodel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def submodel_params
      params.require(:submodel).permit(:name)
    end
end
