class ModelsController < ApplicationController
  before_action :set_model, only: %i[ show edit update destroy ]

  # GET /models
  def index
    @models = Model.all
  end

  # GET /models/1
  def show
  end

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models
  def create
    @model = Model.new(model_params)

    if @model.save
      redirect_to @model, notice: "Model was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /models/1
  def update
    if @model.update(model_params)
      redirect_to @model, notice: "Model was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /models/1
  def destroy
    @model.destroy
    redirect_to models_url, notice: "Model was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def model_params
      params.require(:model).permit(:name, :description, :brand_id, :submodel_id)
    end
end
