json.array!(@images) do |image|
  json.extract! image, :userid, :recipeid, :name
  json.url image_url(image, format: :json)
end
