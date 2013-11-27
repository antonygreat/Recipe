class TypesController < ApplicationController
  before_action :set_type, only: [:show, :edit, :update, :destroy]

 #show all types in database
  def index
    @types = Type.all
  end

  #show all recipes have the certain type
  def show
    @typesets = TypeSet.where("typeid=?",set_type.id)
    @recipes=Array.new()
    i=0
    @typesets.each do |set|
      @recipes[i]= Recipe.find(set.recipeid)
      i+=1
    end
    @i=i
  end

 



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_params
      params.require(:type).permit(:name)
    end
end
