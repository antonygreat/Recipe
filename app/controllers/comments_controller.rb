class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

#add a new comment
  def create 
    @comment = Comment.new(params[:comment])
    @comment.userid=current_user.id
    @comment.isban=false    

    respond_to do |format|
      if @comment.save
        format.html { redirect_to Recipe.find(@comment.recipeid), notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      end
    end
  end
  

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:recipeID, :userID, :isBan, :comment)
    end
end
