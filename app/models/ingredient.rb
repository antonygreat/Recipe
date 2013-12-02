class Ingredient < ActiveRecord::Base
  attr_accessible :name, :groupid
  belongs_to:ingredient_group
  has_many:ingredient_sets
  has_many:recipes, :through => :ingredient_sets
end
