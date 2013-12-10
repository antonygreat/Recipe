class Comment < ActiveRecord::Base
  attr_accessible :recipeid, :userid, :isban, :comment
  belongs_to :user
  belongs_to :recipe
end
