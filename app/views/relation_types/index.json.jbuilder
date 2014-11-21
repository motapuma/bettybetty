json.array!(@relation_types) do |relation_type|
  json.extract! relation_type, :id, :name
  json.url relation_type_url(relation_type, format: :json)
end
