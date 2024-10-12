class SubmodelsController < ApplicationController
  before_action :set_submodel, only: %i[ show edit update destroy ]

  # GET /submodels or /submodels.json
  def index
    @submodels = Submodel.all
  end

  # GET /submodels/1 or /submodels/1.json
  def show
  end

  # GET /submodels/new
  def new
    @submodel = Submodel.new
  end

  # GET /submodels/1/edit
  def edit
  end

  # POST /submodels or /submodels.json
  def create
    @submodel = Submodel.new(submodel_params)

    respond_to do |format|
      if @submodel.save
        format.html { redirect_to @submodel, notice: "Submodel was successfully created." }
        format.json { render :show, status: :created, location: @submodel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @submodel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submodels/1 or /submodels/1.json
  def update
    respond_to do |format|
      if @submodel.update(submodel_params)
        format.html { redirect_to @submodel, notice: "Submodel was successfully updated." }
        format.json { render :show, status: :ok, location: @submodel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @submodel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submodels/1 or /submodels/1.json
  def destroy
    @submodel.destroy!

    respond_to do |format|
      format.html { redirect_to submodels_path, status: :see_other, notice: "Submodel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submodel
      @submodel = Submodel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def submodel_params
      params.require(:submodel).permit(:name, :model_id)
    end
end
