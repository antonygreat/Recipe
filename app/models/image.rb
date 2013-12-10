class Image < ActiveRecord::Base
  attr_accessible :name, :recipeid, :userid
  belongs_to :user
  belongs_to :recipe
end
