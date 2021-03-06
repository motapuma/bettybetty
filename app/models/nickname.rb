class Nickname < ActiveRecord::Base
	belongs_to :candidate
	belongs_to :ally

	validates :nick, presence: true

	def ally_st
		self.ally ? self.ally.name : "---"
	end
	def candidate_st
		self.candidate  ? self.candidate.name : "---"
	end
end
