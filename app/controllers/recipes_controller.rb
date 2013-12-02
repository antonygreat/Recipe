class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    #For getting the ingredient info from ingredient set
    @ingredientset=IngredientSet.where("recipeid=?",set_recipe.id)
    
    @ingredients = Array.new()
    i=0
    @ingredientset.each do |set|
       @ingredients[i]=Ingredient.find(set.ingredientid)
      i+=1
    end

    #For getting the type infor from type set
    @typesets=TypeSet.where("recipeid=?",set_recipe.id)

    @types = Array.new()
    i=0
    @typesets.each do |set|
       @types[i]=Type.find(set.typeid)
      i+=1
    end
    #get comments from db
    @comments = Comment.where("recipeid = ? AND isban = ?", set_recipe.id , false)

    #create new comment
    @comment = Comment.new
    @all_users=User.all
    @all_recipes=Recipe.all

    #create new favorite
    @favorite = Favorite.new

  end

#Create new recipe
  def new
    @recipe = Recipe.new
    @all_users=User.all
    @all_ingredients=Ingredient.all
    @all_types=Type.all
  end


  def edit
    @recipe = set_recipe
    @all_users=User.all
    @all_ingredients=Ingredient.all
  end

#Save the new recipe into db
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.userid=

    respond_to do |format|
      if @recipe.save
        
        #save the ingredients into db
        params[:ingredients][:id].each do |ingre|
          if !ingre.empty?
           @ingredientset=IngredientSet.new(:ingredientid => ingre, :recipeid => @recipe.id)            
           @ingredientset.save
          end
        end

        #save the types into db
        params[:types][:id].each do |type|
          if !type.empty?
            @typeset=TypeSet.new(:typeid => type,:recipeid => @recipe.id)
            @typeset.save
          end
        end
        
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render action: 'new', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:userID, :title, :description, :isBan, :imageID)
    end
end
