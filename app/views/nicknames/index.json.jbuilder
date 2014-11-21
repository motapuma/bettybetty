json.array!(@nicknames) do |nickname|
  json.extract! nickname, :id, :candidate_id, :ally_id, :nick
  json.url nickname_url(nickname, format: :json)
end
