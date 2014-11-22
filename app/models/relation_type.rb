class RelationType < ActiveRecord::Base
	has_many :key_words
	accepts_nested_attributes_for :key_words, :allow_destroy => true
	
	has_many :relations
	has_many :allies,    through: :relations
	has_many :links,through: :relations 
	has_many :candidates,through: :relations 
end
