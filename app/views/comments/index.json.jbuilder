json.array!(@comments) do |comment|
  json.extract! comment, :recipeID, :userID, :isBan, :comment
  json.url comment_url(comment, format: :json)
end
