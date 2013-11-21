json.array!(@recipes) do |recipe|
  json.extract! recipe, :userID, :title, :description, :isBan, :imageID
  json.url recipe_url(recipe, format: :json)
end
