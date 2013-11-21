class IngredientSet < ActiveRecord::Base
  attr_accessible :recipeID, :ingredientID, :amountNum, :unitOfMeasure
  belongs_to:ingredient
  belongs_to:recipe
end
