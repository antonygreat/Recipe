class Comment < ActiveRecord::Base
  attr_accessible :recipeID, :userID, :isBan, :comment
  belongs_to:user
  belongs_to:recipe
end
