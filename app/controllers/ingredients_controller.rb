class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  #show the recipe list by certain ingredient
  def show
    @ingredientsets = IngredientSet.where("ingredientid=?",set_ingredient.id)
    @recipes=Array.new()
    i=0
    @ingredientsets.each do |set|
      @recipes[i]= Recipe.find(set.recipeid)
      i+=1
      end
    @i=i
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :groupID)
    end
end
