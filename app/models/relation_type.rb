class RelationType < ActiveRecord::Base
	has_many :key_words
	accepts_nested_attributes_for :key_words, :allow_destroy => true
end
