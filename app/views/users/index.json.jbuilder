json.array!(@users) do |user|
  json.extract! user, :id, :name, :answered, :common, :picture
  json.url user_url(user, format: :json)
end
