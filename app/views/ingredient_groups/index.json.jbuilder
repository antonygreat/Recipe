json.array!(@ingredient_groups) do |ingredient_group|
  json.extract! ingredient_group, :name
  json.url ingredient_group_url(ingredient_group, format: :json)
end
