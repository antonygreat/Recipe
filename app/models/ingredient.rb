class Ingredient < ActiveRecord::Base
  attr_accessible :name, :groupID
  belongs_to:ingredient_group
  has_many:ingredient_set
end
