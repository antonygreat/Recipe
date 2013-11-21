class TypeSet < ActiveRecord::Base
	attr_accessible :typeID, :recipeID
	belongs_to:type
end
