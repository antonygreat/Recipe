json.array!(@favorites) do |favorite|
  json.extract! favorite, :recipeID, :userID
  json.url favorite_url(favorite, format: :json)
end
