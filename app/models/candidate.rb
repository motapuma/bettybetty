class Candidate < ActiveRecord::Base
	has_many :nicknames
	accepts_nested_attributes_for :nicknames, :allow_destroy => true
end
