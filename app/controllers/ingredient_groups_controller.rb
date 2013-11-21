class IngredientGroupsController < ApplicationController
  before_action :set_ingredient_group, only: [:show, :edit, :update, :destroy]

  # GET /ingredient_groups
  # GET /ingredient_groups.json
  def index
    @ingredient_groups = IngredientGroup.all
  end

  # GET /ingredient_groups/1
  # GET /ingredient_groups/1.json
  def show
  end

  # GET /ingredient_groups/new
  def new
    @ingredient_group = IngredientGroup.new
  end

  # GET /ingredient_groups/1/edit
  def edit
  end

  # POST /ingredient_groups
  # POST /ingredient_groups.json
  def create
    @ingredient_group = IngredientGroup.new(ingredient_group_params)

    respond_to do |format|
      if @ingredient_group.save
        format.html { redirect_to @ingredient_group, notice: 'Ingredient group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ingredient_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @ingredient_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredient_groups/1
  # PATCH/PUT /ingredient_groups/1.json
  def update
    respond_to do |format|
      if @ingredient_group.update(ingredient_group_params)
        format.html { redirect_to @ingredient_group, notice: 'Ingredient group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ingredient_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredient_groups/1
  # DELETE /ingredient_groups/1.json
  def destroy
    @ingredient_group.destroy
    respond_to do |format|
      format.html { redirect_to ingredient_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient_group
      @ingredient_group = IngredientGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_group_params
      params.require(:ingredient_group).permit(:name)
    end
end
