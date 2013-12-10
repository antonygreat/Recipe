class TypeSet < ActiveRecord::Base
	attr_accessible :typeid, :recipeid
	belongs_to :type
end
