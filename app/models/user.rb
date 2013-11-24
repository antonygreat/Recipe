class User < ActiveRecord::Base
  attr_accessible :username, :password, :isadmin, :isban, :isactivate
  has_many:recipes
  has_many:favorites
  has_many:comments
end
