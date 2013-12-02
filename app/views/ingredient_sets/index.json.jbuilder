json.array!(@ingredient_sets) do |ingredient_set|
  json.extract! ingredient_set, :recipeID, :ingredientID, :amountNum, :unitOfMeasure
  json.url ingredient_set_url(ingredient_set, format: :json)
end
