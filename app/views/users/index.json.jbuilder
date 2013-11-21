json.array!(@users) do |user|
  json.extract! user, :username, :password, :isAdmin, :isBan, :isActivate
  json.url user_url(user, format: :json)
end
