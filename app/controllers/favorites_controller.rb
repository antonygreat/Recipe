class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

 def create
    @favorite = Favorite.new(params[:favorite])
    @favorite.userid=params[:users][:id]

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to Recipe.find(@favorite.recipeid), notice: 'The recipe has been added into your favorite.' }
        format.json { render action: 'show', status: :created, location: @favorite }
      else
        format.html { render action: 'new' }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
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
