class Notice
	require 'json'


	def initialize(link,article_title,article_text,search_text)
		@link  = link
		@article_title = article_title
		@article_text  = article_text
		@search_text = search_text
	end

	def to_hash
		return {"link"=>@link, "article_title"=>@article_title, "article_text"=>@article_text,"search_text"=>@search_text }
	end

	def article_title
		@article_title || ""
	end

	def link
		@link || ""
	end

	def article_text
		@article_text || ""
	end
	def search_text
		@search_text || ""
	end


end