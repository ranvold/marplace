class ModelsController < ApplicationController
  before_action :set_model, only: %i[ show edit update destroy ]

  def index
    @models = Model.all
  end

  def show
  end

  def new
    @model = Model.new
    @brands = Brand.select_brands
  end

  def edit
    @brands = Brand.select_brands
  end

  def create
    @model = Model.new(model_params)

    if @model.save
      redirect_to @model, notice: "Model was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @model.update(model_params)
      redirect_to @model, notice: "Model was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @model.destroy
    redirect_to models_url, notice: "Model was successfully destroyed."
  end

  private
  
    def set_model
      @model = Model.find(params[:id])
    end

    def model_params
      params.require(:model).permit(:name, :description, :brand_id)
    end
end
