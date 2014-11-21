json.array!(@allies) do |ally|
  json.extract! ally, :id, :name
  json.url ally_url(ally, format: :json)
end
