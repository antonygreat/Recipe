class IngredientGroupsController < ApplicationController
  before_action :set_ingredient_group, only: [:show, :edit, :update, :destroy]

  #show all ingredient groups and 5 ingredients
  def index
    @ingredient_groups = IngredientGroup.all
    @ingredients = Ingredient.all
  end

  #show the certain ingredient group and all ingredients
  def show
    @ingredients = Ingredient.where("groupid=?",set_ingredient_group.id)
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
