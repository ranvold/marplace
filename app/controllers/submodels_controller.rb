class SubmodelsController < ApplicationController
  before_action :set_submodel, only: %i[ show edit update destroy ]

  def index
    @submodels = Submodel.all
  end

  def show
  end

  def new
    @submodel = Submodel.new
    @models = Model.select_models
  end

  def edit
    @models = Model.select_models
  end

  def create
    @submodel = Submodel.new(submodel_params)

    if @submodel.save
      redirect_to @submodel, notice: "Submodel was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @submodel.update(submodel_params)
      redirect_to @submodel, notice: "Submodel was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @submodel.destroy
    redirect_to submodels_url, notice: "Submodel was successfully destroyed."
  end

  private

    def set_submodel
      @submodel = Submodel.find(params[:id])
    end

    def submodel_params
      params.require(:submodel).permit(:name, :model_id)
    end
end
