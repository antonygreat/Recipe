class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  def index
    @favorites = Favorite.where("userid=?",current_user.id)
  end

  def create
    @favorite=Favorite.find_by(userid: current_user.id, recipeid: params[:favorite][:recipeid])
    
    if @favorite.nil? #this recipe hasn't been added by this user
      @favorite = Favorite.new(params[:favorite])
      @favorite.userid=current_user.id    
     
      if @favorite.save
        @recipe=Recipe.find(@favorite.recipeid)
        @recipe.favnum+=1
        @recipe.save
        redirect_to @recipe
      end
    else #the recipe has been added by user
      @recipe=Recipe.find(params[:favorite][:recipeid])
      @recipe.favnum-=1
      @recipe.save
      @favorite.destroy
      redirect_to @recipe 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:recipeID, :userID)
    end
end
