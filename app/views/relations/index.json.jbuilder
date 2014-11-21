json.array!(@relations) do |relation|
  json.extract! relation, :id, :link_id, :ally_id, :candidate_id, :relation_type_id
  json.url relation_url(relation, format: :json)
end
