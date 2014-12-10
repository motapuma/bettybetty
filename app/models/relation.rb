class Relation < ActiveRecord::Base
	has_and_belongs_to_many :key_words

	belongs_to :link
	belongs_to :ally
	belongs_to :candidate
	belongs_to :relation_type
	accepts_nested_attributes_for :link, :allow_destroy => true

	validate :candidate     ,presence: true
	validate :relation_type ,presence: true
	validate :ally          ,presence: true
	validate :link          ,presence: true


	def link_st

		return self.link ? self.link.url : "---"
	end

	def ally_st
		return self.ally ? self.ally.name : "---"
	end

	def candidate_st
		return self.candidate ? self.candidate.name : "---"
	end

	def relation_type_st
		return self.relation_type ? self.relation_type.name : "---"
	end

	def candidate_avatar
		return self.candidate ? self.candidate.avatar.url : ""
	end

	def ally_avatar
		return self.ally ? self.ally.avatar.url : ""
	end

	def self.relations_as_json

		nodes = []
		links = []
		count = 0
		Relation.all.each do |rel|
			nodes << {name:rel.candidate_st ,group: rel.candidate ? rel.candidate.id : 0, avatar:rel.candidate_avatar }
			nodes << {name:rel.ally_st      ,group: rel.ally      ? rel.ally.id      : 0, avatar:rel.ally_avatar }
			links << {source:count,target:count+1 ,value:20}
			count += 2
		end
		 json = {nodes: nodes,links: links }.to_json
		 puts "#{json}"
		 return json.html_safe

	end


end
