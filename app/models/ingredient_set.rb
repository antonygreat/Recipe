class IngredientSet < ActiveRecord::Base
  attr_accessible :recipeid, :ingredientid, :amountnum, :unitofmeasure
  belongs_to :ingredient
  belongs_to :recipe
end
