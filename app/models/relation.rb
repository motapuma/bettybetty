class Relation < ActiveRecord::Base
	has_and_belongs_to_many :key_words
end
