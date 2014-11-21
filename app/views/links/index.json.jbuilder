json.array!(@links) do |link|
  json.extract! link, :id, :title, :text, :journal, :author, :url
  json.url link_url(link, format: :json)
end
