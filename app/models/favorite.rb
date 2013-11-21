class Favorite < ActiveRecord::Base
  attr_accessible :recipeID, :userID
  belongs_to:user
  belongs_to:recipe
end
