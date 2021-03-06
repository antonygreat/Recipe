class Recipe < ActiveRecord::Base
  attr_accessible :userid, :title, :description, :isban, :imageid, :favnum
  has_many :ingredient_sets
  has_many :ingredients, :through => :ingredient_sets
  has_many :comments
  has_many :favorites
  belongs_to :user
  has_one :image
end
