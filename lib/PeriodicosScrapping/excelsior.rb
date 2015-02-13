

class Excelsior
	require 'mechanize'
	require 'nokogiri'
	require 'notice'

	JOURNAL_URL = #aqui espero pongan su url 

	def get_links_info(external_links)

		mechanize_agent2 = Mechanize.new()
		arr = []

		external_links.each do |link|


			page = mechanize_agent2.get link



			#*******************************
			# Espero que me regresen:
			# => "titulo" clase=> Nokogiri::Node  EJEMPLO:  "page.search("//h1[@id='titleNote']").first"
			# => "text"   clase=> Nokogiri::Node  EJEMPLO:  "page.search("//div[@class='noteText']").first"
			#*******************************



			puts correct_link(link)
			puts correct_title(titulo)

			notice = Notice.new(correct_link(link),correct_title(titulo),correct_text(texto),busqueda)
			
			arr << notice.to_hash


		end

		return arr.to_json

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
						



						#*******************************
						# Espero que me regresen:
						# => "links" clase=> Nokogiri::NodeSet  EJEMPLO:  "element.search("a") "
						#*******************************

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

		txt = get_links_info(external_links)
		puts txt
		return txt

	end




end

