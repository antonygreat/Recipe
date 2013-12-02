class Favorite < ActiveRecord::Base
  attr_accessible :recipeid, :userid
  belongs_to:user
  belongs_to:recipe
end
