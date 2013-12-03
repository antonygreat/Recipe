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
        redirect_to Recipe.find(@favorite.recipeid)
      end
    else #the recipe has been added by user
      @favorite.destroy
      redirect_to Recipe.find(params[:favorite][:recipeid])
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url }
      format.json { head :no_content }
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
