class User < ActiveRecord::Base
  attr_accessible :username, :password, :isAdmin, :isBan, :isActivate
  has_many:recipes
  has_many:favorites
  has_many:comments
end
