class Recipe < ActiveRecord::Base
  attr_accessible :userID, :title, :isBan, :imageID
  has_many:ingredient_sets
  has_many:comments
  has_many:favorites
  belongs_to:user
end
