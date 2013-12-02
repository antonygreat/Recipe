class HomeController < ApplicationController

  def index

#latest recipes
    @latest_recipes = Recipe.last(10)
#most clicked recipes
    @viewest_recipes
#most liked recipes
    @likest_recipes
  end

end
