

class BettySugestions
	require 'mechanize'
	require 'nokogiri'
	require 'notice'

	def get_external_links (links)
		
		http = "http://"
		result = []
		
		links.each do |link|
			
			result << link["href"] if link["href"] 

		end
		result
	end

	def correct_link(link)
		#st = link["href"]
		#st = st [7..-1]
		return link
	end

	def correct_title(title)
		return title.content if title
		return "NO Title"
	end

	def correct_text(text)

		return "No text" if !text

		st = ""
		text.children.search("p").each do |p|
			st = st + p.inner_text
		end
	 	#st = st.delete("\r")
		return st.strip#.delete("\n")
	end

	def create_json_with_links(external_links)

		mechanize_agent2 = Mechanize.new()
		arr = []

		external_links.each do |link|


			page = mechanize_agent2.get link

			titulo = page.search("//h1[@id='titleNote']").first
			titulo = page.search("//h2[@class='titleNote']").first  if ! titulo
			titulo = page.search("//h2[@class='noteTitle']").first  if ! titulo
			texto  = page.search("//div[@class='noteText']").first


			puts correct_link(link)
			puts correct_title(titulo)

			notice = Notice.new(correct_link(link),correct_title(titulo),correct_text(texto),"")
			
			arr << notice.to_json if notice


		end

		arr.to_json

	end

	def suggestions_for(journal_url,cand_nicknames,key_words,ally_nick_names) 

		external_links = []
		buscando = ""
		begin

			cand_nicknames.each do |nickname|
				key_words.each do |key_word|
					ally_nick_names.each do |ally_nick|

						sleep(2)
						mechanize_agent = Mechanize.new()

						search_text = "#{nickname.nick} #{ally_nick.nick} #{key_word.word}"
						buscando    = search_text
						puts "SERACHING: #{search_text}"
						journal        = mechanize_agent.get(journal_url)
						journal_form   = journal.forms.first
						journal_form.q = search_text

						query_result = mechanize_agent.submit journal_form

						column         = query_result.search("div[@id='IzqDisplayColumn']").first
						links          = column.search("div[@class='HeadNota']").children.search("a")
						external_links = external_links.concat(get_external_links(links) )

						puts "si obtuve los #{external_links.count}"
					end
					
				end
			end 

			
		rescue
			puts "ERROR CON #{buscando}"
			puts $!, $@
			#return "ERROR CON #{search_text}"
		end

		txt = create_json_with_links(external_links)
		puts txt
		return txt

	end




end

