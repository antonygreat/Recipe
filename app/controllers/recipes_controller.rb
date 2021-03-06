class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.where("userid=?",current_user.id)
  end

  def show
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
    @recipe.userid=current_user.id
    @recipe.isban=false
    @recipe.favnum=0

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

        #save the image into db
        dir ="#{Rails.root}/app/assets/images/Recipe/#{@recipe.id}"

        Dir.mkdir(dir) unless File.exists?(dir)

        uploaded_io = params[:recipe][:image]
        File.open(Rails.root.join('app', 'assets','images', 'Recipe', @recipe.id.to_s, uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end
        @image=Image.new(:recipeid => @recipe.id, :name => uploaded_io.original_filename)
        @image.save

        
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
