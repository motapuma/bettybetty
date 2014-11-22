class Relation < ActiveRecord::Base
	has_and_belongs_to_many :key_words

	belongs_to :link
	belongs_to :ally
	belongs_to :candidate
	belongs_to :relation_type
	accepts_nested_attributes_for :link, :allow_destroy => true


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



end
