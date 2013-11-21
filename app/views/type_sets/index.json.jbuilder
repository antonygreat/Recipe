json.array!(@type_sets) do |type_set|
  json.extract! type_set, :recipeID, :typeID
  json.url type_set_url(type_set, format: :json)
end
