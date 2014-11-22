class Notice
	require 'json'


	def initialize(link,article_title,article_text,search_text)
		@link  = link
		@article_title = article_title
		@article_text  = article_text
		@search_text = search_text
	end

	def to_json
		{"link"=>@link, "article_title"=>@article_title, "article_text"=>@article_text,"search_text"=>@search_text }.to_json
	end


end