class TypeSetsController < ApplicationController
  before_action :set_type_set, only: [:show, :edit, :update, :destroy]

  # GET /type_sets
  # GET /type_sets.json
  def index
    @type_sets = TypeSet.all
  end

  # GET /type_sets/1
  # GET /type_sets/1.json
  def show
  end

  # GET /type_sets/new
  def new
    @type_set = TypeSet.new
  end

  # GET /type_sets/1/edit
  def edit
  end

  # POST /type_sets
  # POST /type_sets.json
  def create
    @type_set = TypeSet.new(type_set_params)

    respond_to do |format|
      if @type_set.save
        format.html { redirect_to @type_set, notice: 'Type set was successfully created.' }
        format.json { render action: 'show', status: :created, location: @type_set }
      else
        format.html { render action: 'new' }
        format.json { render json: @type_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_sets/1
  # PATCH/PUT /type_sets/1.json
  def update
    respond_to do |format|
      if @type_set.update(type_set_params)
        format.html { redirect_to @type_set, notice: 'Type set was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @type_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_sets/1
  # DELETE /type_sets/1.json
  def destroy
    @type_set.destroy
    respond_to do |format|
      format.html { redirect_to type_sets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_set
      @type_set = TypeSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_set_params
      params.require(:type_set).permit(:recipeID, :typeID)
    end
end
