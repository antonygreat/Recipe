class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def new
    @recipe = Recipe.new
    @all_users=User.all
    @all_ingredients=Ingredient.all
    @all_types=Type.all
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.userid=current_user.id
    @recipe.isban=false

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

 

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end


  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:userid, :recipeid, :name)
    end
end
